let data = '';
process.stdin.on('data', chunk => data += chunk);
process.stdin.on('end', () => {
  try {
    const j = JSON.parse(data);
    const path = require('path');
    const { execSync } = require('child_process');

    const model = j.model?.display_name || '?';
    const dir = path.basename(j.cwd || '?');
    
    let git = '';
    try { git = execSync('git rev-parse --abbrev-ref HEAD', {encoding:'utf8', timeout:2000}).trim(); } catch(e) {}
    
    const outputStyle = j.output_style?.name || '?';
    const remaining = j.context_window?.remaining_percentage != null
      ? j.context_window.remaining_percentage.toFixed(1) + '%'
      : 'N/A';
    const cost = j.cost?.total_cost_usd != null
      ? '$' + j.cost.total_cost_usd.toFixed(2)
      : '$0.00';

    const parts = [
      `[${model}]`,
      `[${dir}]`,
      git ? `[${git}]` : '',
      `[${outputStyle}]`,
      `[잔여:${remaining}]`,
      `[비용:${cost}]`,
    ].filter(Boolean);

    process.stdout.write(parts.join('') + '\n');
  } catch(e) {
    process.stdout.write('ERR:' + e.message + '\n');
  }
});