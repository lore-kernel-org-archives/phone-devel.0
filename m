Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B533D511
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316402; cv=none; b=GYSJcKx0dIXs22Ixs0GsiYeUbw8dE0SfZ+6tKhLYVXO390BdMvqZ8LMdT8GZDwq0nMES3W7saFGb4VA38HRAId2ozlnFjn/o6BIowN28enD/d8/WoENjB+Q1J4ZbqhDhnzy783pg7SiiVrogz9efBb4WK093oHognyYQ4jnM0qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316402; c=relaxed/simple;
	bh=J+U5drShINo5+0B3DYDVjx3TPOFOzJe4Hqp6zGMExds=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ExPMR1gmL61DoIGHbDwn2DAWYy5O0kr1YTNbWMkPZzkAkaE2DiLqUESBTroTwS7igC1nexbWNw41Zq9k7bETxVbi5yrwcJtRJkuYZJhzxOij3kKMqU25Auq/RgEJNjgfoBla+pKRBeOYPAiNX7G9ilZwkMXlI0FEPM3rC9igWOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lbtg1hK3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lbtg1hK3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so1045536f8f.2
        for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 04:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773316399; x=1773921199; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=44LXRHinVhycilszR/4yNd78RLiYQ/Nblg4COhfoEQc=;
        b=Lbtg1hK3yB3gYJ56R5yPo3Tx9k2eZYG8+itJUNHVDWUJUXTDBu0kzBHMQqaureLXVj
         qxNOepIhvFJrhr1W6ECWaS18js0pWx3Pa+6tMb6EHuY1RR6glc4uhuhrTT62hJptXQD7
         E3CzztCMcd0AC46SSWKREQxHRjVWAwp0eZqclmqvY9vUhs1BSzmzysIQbOweXvdGs2iQ
         8mrzW5gptAhciyV2B6lPdb5AXdTw9R1jR/C10oikQZC/NMdQQliwskkXGD6Ng+v/NJoy
         dJjcoH07vL9XdLuGI5Oqyb1SOH5hni1V/nnss9KX71lUd76R94FNL19e8eU5ayciAXX+
         VlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316399; x=1773921199;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44LXRHinVhycilszR/4yNd78RLiYQ/Nblg4COhfoEQc=;
        b=atWEReFTNl/RNosMkR8E6Uf0ccLmJ3LSoqrzAcHGBVn4crJDtwAWIL4ZSvndYPLy8W
         Qh93aVjSP3Lf6Tse1XvlO8x/i/yzQravKivzEGZKnjuzm3w29pjbsPJrP6VaR3nIGxW6
         jEVIN23NKGSsLcc0xWbmxpWKlI4wYS954hn4GIKnDt0wbgIDBirs26WqV2aTHXRv8OZG
         RYFxaM8tYHTFCamfzlzsnjheJKxa21Ty68/ugobnGhjGvHVqe1lIqXwoXum3sJ/c+4SH
         Xx1ZF/7dMJgcaJ+k0rXmwb0Wgo86bVWvsp7DzIRSwV816DuQfFqYyzyIII4tsBiZWI5i
         VAKg==
X-Forwarded-Encrypted: i=1; AJvYcCVfnqhmZY+9JQkiecxGln2LzzrGS/e2Xwxl0v9/+xfy3ADMSZci+EYSdYzsz8FlRIS5LYXz8xqi0ZOGGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyolfk3T7xRHqGp98PdzW9mO6o/cAgpf6O0KK2uc+kgd5PlX8f7
	dEEcKdaT8TldgmT/6UVoq+HhRAaGkuCLJ772fTf4246kvUGTDPTwRXQO
X-Gm-Gg: ATEYQzz6sPBYZtLGfhZdsfxZY0z3qN0wZqKELRJrkpNexRHvJKzAEXF6ORP4Rj5rGph
	B+MTrHxKWrC9F+JNtyJ+JxBgW+ShEcmosxXTt8w/Rze7FRxqoIkDa/rhBC0K4t4PQoDvZqm7EnH
	cfJvQzSLkZSv5hddHM7N8//fYozVwlpW1dON2zV8L+XlQ+tTHOrj0Q/ejgPBs5CTfe7ALBHL6q8
	V/EqDscp8CbgHnIEIGLAe5dtHJmmoSSYaNN4Q5OarK9IgqO1axVM8ZI0DtPyZkN+NkvZcNqzgto
	mzztxqRVKaLGnpS2bX3YiZsmuRzvoObhGCBaUIvQ9knkelOzeSvPlY/fziB770NZrRtpOWiLVtS
	qu5ZwEvaEglY1ZDbZCulZBTJgKUI/W8iC8DQaAlLKkUwHJz4odtmzRHFdiD1P6UPb63MDoF7ITq
	fcQGGaFnPg+EzIoJblXRUwtvwfRQ==
X-Received: by 2002:a05:6000:186b:b0:439:b046:2044 with SMTP id ffacd0b85a97d-439f81f2334mr11880791f8f.12.1773316398625;
        Thu, 12 Mar 2026 04:53:18 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm7044960f8f.31.2026.03.12.04.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:53:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v2 0/3] iio: light: vcnl4000: add regulator support
Date: Thu, 12 Mar 2026 13:53:11 +0200
Message-Id: <20260312-vcnl4000-regulators-v2-0-2bdebbcbb58a@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQrCMBBEf6Xs2cim1VA8+R+lh3TdtgttIokGp
 eTfjQVvHt8w82aDyEE4wqXaIHCSKN4VqA8V0GzdxEpuhaHG2mCjUSVyywkRVeDpudiHD1ENNOq
 htaiJDZTlPfAor93a9YVniaX33k+S/qY/n/7rS1qhMmYojZb4bJrrtFpZjuRX6HPOH0D/Ida2A
 AAA
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
Changes in v2:
- Removed double quotes in includes.
- Reordered includes alphabetically.
- Enabled regulators before the mutex is initialized.
- Replaced direct usage of &client->dev with a variable.
- Link to v1: https://lore.kernel.org/r/20260311-vcnl4000-regulators-v1-0-66b6038ce563@gmail.com

---
Erikas Bitovtas (3):
      dt-bindings: iio: light: vcnl4000: add regulators
      iio: light: vcnl4000: add support for regulators
      iio: light: vcnl4000: move client->dev in probe into a variable

 .../bindings/iio/light/vishay,vcnl4000.yaml        |  7 ++++
 drivers/iio/light/vcnl4000.c                       | 41 +++++++++++++---------
 2 files changed, 32 insertions(+), 16 deletions(-)
---
base-commit: f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
change-id: 20260310-vcnl4000-regulators-bcf1b8a01ce6

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>

