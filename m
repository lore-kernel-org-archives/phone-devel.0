Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EFE2701DC
	for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 16:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773504401; cv=none; b=RvmmKrkTtT6z5Mx6y+i9/hg3wfg46gQslKqtWxhtmEq5pzgS/YrSvNVa15aoajgbykdGGOEQ3t0JK5XJOZxpf2RU9gnG1nUHz+OYLIHa5+lyHaWV0N35JYv/5H7kq5HWB4t8iZyTHQ63D3fnDnsDAYz6zv9KqZGSUmL/ZuOnN70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773504401; c=relaxed/simple;
	bh=PVNLhKnuvnLq5lryTjPze92pjMzYxlP0inllyDZUJLM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L6CpsX00QSMT2oC6twPcQj478sRJ8ZlkK8+yb4intQlPZC/sXf2Ih5CFopQGdNVFWv1+YY0r/xl7YMf0VwQDLH94ya46JDX5PBQGqS6ygw1IbL/WEp2iTTShKBOPJyc56cz/IcIBG1lVcAzlgMR1RSbM4LQlzzfsruJgk9CPEmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0FENvpz; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0FENvpz"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9773abf811so245094766b.0
        for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773504397; x=1774109197; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u2gE4AmHfyDdJk2rWgz4dNOtkVHCWBvMjN9Y8lBsN1k=;
        b=f0FENvpzkPEGjHiCvfvsjqvC8KFbPozoLU3EQJLnxV6kbHgZDIAzOdVXnTFHe6VaMs
         F9PGz1IJ01sn0xVK4iHPO4q+DtnoiJXkmX6v0DwEC2aeGwwUAoC+soHV7Y2c/Zt/LuRP
         uVQyaaU93lVUFoPsATnuuWffnjliwqIrWiVIj6rZMQlZ32k7JOmU7KDcYnsiShR1A04+
         sEr7wXcxvGcr9loDgnfT4wRARrAHdY2earvQgLut5i1YOu84r+DUWvb8w+MLjCFoqaGk
         sEoOQIOpdysz5YXjfdzwFnY/6Bb7YDH6BdTFtgolHcfueO1AsnXeNoGhJIBMHwH2Yszk
         uG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773504397; x=1774109197;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2gE4AmHfyDdJk2rWgz4dNOtkVHCWBvMjN9Y8lBsN1k=;
        b=WiDrZAALevff8Ye+0yNO9e2qMy2IdxsqpQTsg7tQsy24zC3GW+qjjhgSvbKjiyCBiC
         HlOsp6o3ksXLzBEZTH/z0U/O1Ajv6Q17q6cbRJXsTHEFb9XKJQUUdnqMcfgu30xBaMKs
         c3VymQarBuJLB1jSI7H0SR9jfE+MM24ar6RTX2dclVuVm+Ng9NzAbnTyqsoQLIKoA6bT
         ZuKNxXv630uQ2LFvBqVaKLElhAtsgcCvznTfN5pr9jr3LT4Lsee9eu29U0wRZlN8UQit
         k3EYSOdrVPdVXbKNE0g5SKuNjfL1kvUJWuOmW5btBkBfI5t5LODW+thxZ9QQUbNw87Mr
         Ut7A==
X-Forwarded-Encrypted: i=1; AJvYcCUoO1yty75zhEeJyRLPS4x3/xYdRYzMgJiElr/JcHgl8Y7INYBAf9gFL7k9hy71S11HxsISOqbCgXlGQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYhJ2dNkQAbohGq5uIbq+JxgWw8DTV+Z8Zz1KC/XsZFfcNk0Er
	vWnexalCEh0Lxkg/B+ibmoj6zCnFNOE4yNZVhLsxAaRTjRoQxQ1o7dLr
X-Gm-Gg: ATEYQzwCO8GL0l5fU5qVr+TzOsfihVEHrAfkrJGlh/MRMsHazFsdKflBu+mExRJm9ro
	7Y6qOZtWNOtJYstwP92e/gLaQVHflEQdjsht29Se9MHwuJq7StvvvsIo/5bfBt9Y2B3R4da7IKu
	cFLNh6AvUKvYL7MmAcq1U1uxzkJ3AzwHhQ6LColtfRMKAtud4hrsNYxi73IU694fx30tpCrcfo8
	J1joKhURGW1F1wTKvEI6BEAP6MSZSVXopTdUFLYPNjDjgVtgH1Bl5hakElc/MygGa+lKvjv3B6v
	NgWXFtv1Lq3ffXQ8LVrqHHo3gnTPq8fH9dyuJnmulWvZytGZ+hTsnQy7KsKYccjqCpYusu7t0fS
	onbaR99nkbNTSMkg11uMlG6rTz6okbeuFFLv9DbdjTHcjOxT6pybsttWFRMo+xF/9wjOq+Xjxs+
	cek/GLA5rGUCgQaMWGjG8VrYydZCyF0orCrqW2
X-Received: by 2002:a17:907:3cd2:b0:b97:3734:8d49 with SMTP id a640c23a62f3a-b9765145762mr437909166b.38.1773504397154;
        Sat, 14 Mar 2026 09:06:37 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b978b8625d3sm151722366b.52.2026.03.14.09.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 09:06:36 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v3 0/6] iio: light: vcnl4000: add regulator support
Date: Sat, 14 Mar 2026 18:06:29 +0200
Message-Id: <20260314-vcnl4000-regulators-v3-0-3c4a48d30676@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQqDMBAF4KtI1k2ZxBqkq96jdJGJYxzwpyRta
 BHv3igUXLh8w3vfzCJSYIriWswiUOLI05hDeSqE6+zoSXKTs9CgDZQKZHJjfwEAGci/e/uaQpT
 oWoW1BeXIiLx8Bmr5s6n3R84dx9z7bk+SWq9/Tx16SUmQxmBu1I4qU978YLk/u2kQq5f03tDHh
 s6GxoYQHWJV272xLMsP2sEiRfoAAAA=
X-Change-ID: 20260310-vcnl4000-regulators-bcf1b8a01ce6
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Raymond Hackley <raymondhackley@protonmail.com>
X-Mailer: b4 0.14.3

This patch series introduces support for voltage supply, I2C and cathode
regulators. This fixes an issue where if a regulator is shared between
the proximity sensor and some other device, and the other device is
powered off, the proximity sensor would be powered off as well.

One of the commits includes a Reported-by: tag without a Closes: tag -
the report was done outside of LKML.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v3:
- Added a more detailed description for supplies in the dt-bindings commit.
- Separated sorting includes into a commit of its own.
- Replaced all occurrences of mutex_init with its device-managed
  counterpart.
- Moved client->dev variable declaration into a commit for adding
  regulators.
- Removed redundant dev_err messages in probe function.
- Replaced all direct usages of client->dev and data->client into usages
  by variable.
- Link to v2: https://lore.kernel.org/r/20260312-vcnl4000-regulators-v2-0-2bdebbcbb58a@gmail.com

Changes in v2:
- Removed double quotes in includes.
- Reordered includes alphabetically.
- Enabled regulators before the mutex is initialized.
- Replaced direct usage of &client->dev with a variable.
- Link to v1: https://lore.kernel.org/r/20260311-vcnl4000-regulators-v1-0-66b6038ce563@gmail.com

---
Erikas Bitovtas (6):
      dt-bindings: iio: light: vcnl4000: add regulators
      iio: light: vcnl4000: sort includes by their name
      iio: light: vcnl4000: replace mutex_init with devm_mutex_init
      iio: light: vcnl4000: add support for regulators
      iio: light: vcnl4000: remove error messages for trigger and irq
      iio: light: vcnl4000: use variables for I2C client and device instances

 .../bindings/iio/light/vishay,vcnl4000.yaml        |  7 ++
 drivers/iio/light/vcnl4000.c                       | 76 +++++++++++++---------
 2 files changed, 52 insertions(+), 31 deletions(-)
---
base-commit: 6e03baeeb160e6cfd72f2c39f26c50bcd925c7a0
change-id: 20260310-vcnl4000-regulators-bcf1b8a01ce6

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>

