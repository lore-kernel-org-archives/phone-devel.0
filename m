Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E52C4657DA
	for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 18:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572556; cv=none; b=Tvug6HhH/QICNP6SK87fZxhEclprG4yL25g7ZsIMP9wSd/S9jKxAktaM5Lj899ehjvEfiK2g+GNXcip52c9EJfCfjXi2Qv9o0yMybZVBXfDc0Nwyiy/YbK/Pg4Ixn/Jd/eSN/xQxB+Z/cURpyJ5Fc/TUZbZr9yblUlyXHodgURM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572556; c=relaxed/simple;
	bh=VXkbqPKO4qZPRHSbqS7kvLNOxopljNB7WO8rURb5MO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QoQjKipFwELhm0xFtO2s05CAlyP6huw55FnnqBN4rvHi7M21rrAAw1v6jHxXNT56AbYyrby8v1S+ogePtYicV3eFtIOFzqrVty624cy+sJOws1cQHCV9teow18UMsiu37wkedKXcz6VGjayvgFjVGU45kjGit1k4eG0KcqpzDBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBLrPH1y; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBLrPH1y"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8f83efb5729so135388485a.1
        for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 11:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572554; x=1778177354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8cPDmpSFOQtey/9Ljj5/074skBZju2AdaWUz5tcdlo=;
        b=CBLrPH1y6hNXZixhhMQiRyAolRHarNmzJkfqUpHUJxLn2I3LPrH0JiXm50OdXSFXUL
         vefQLNZXxlhH6N+HoCG+fUu9UWDxvbjWY6L8FXR+s1oRiN0OgLb68ewqUXOMJTE7sBGd
         vqkpmdKnFaQ6VddkpFsLJpUxAmxhH8zgaj0aOFXo7/RkMvEGVVR9BcWtVEUmkxpSEGa2
         WdaQV0gIwMj4p9jLQMedrGuZ13Q9NN2PB4cRM2DXiLl/j0JZa+t+v7JnTtj7DFl++EJ7
         KnAUJrwkeXsuMor7LiGWF2l5RgPIrt2H9X3H2dAL4Gu4sZh10PrgOj6bJfehSf6duTYz
         yjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572554; x=1778177354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8cPDmpSFOQtey/9Ljj5/074skBZju2AdaWUz5tcdlo=;
        b=V1YzDZWBXwAIvtz+DtzBXg+soklsxQlgOTyP2KTyQHVOowB7DUEUzWDKJHJWR/lu1h
         LdQhUBCYX6CkLGNpZBkaeCwQ23kMlvLd3T1UAicX5pBUnnwtyIiHZp/oSKnGm/WzQFzu
         +Mo3IFr/B6zd5/4PmF1FfuQKKXX0ij9d5hbZC2ZoTmI/YmEBXQZWj6FMB0p4VQo7Tu4i
         CjoxVEbGUFxDovx+4KhLFFq7EzCZ8BY2L3WDiow2VHCvFG7iqjqe++fX+FgZKp1uahV7
         5JntoVIrPWt0tlhB7spWG6+HSWrbfXM0TvPgKCYlJg4x4jBhHhFBVjESZf4yvyIj+ai7
         Tbcw==
X-Forwarded-Encrypted: i=1; AFNElJ/HfH8lK94EsS3B2boDdmE2c2pVH6XPiPr9p/CWhptuPx5Jizzz7H+6CeuIPiK9VjDxMRxvB0abg2zY6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAImi/frMKaYLAMxkOl6YcQFf6/0Jbio0GlRjqEPNdeahP+i9P
	ilT+PwfO3H01bk4v6ZwqCkRM3jiA1YWPCozEDpm4EC4HswthfqTdDe1C
X-Gm-Gg: AeBDiesj7V3H9nbW3x/5Z8o2uQbhfAByRi9JMa2GrZVbj+JbgNKcyTUGvWiPQNc7Lgb
	Z4OWDAVATIJdh5F8f5W98aeS0dPml9LuAVns2RJcpUsj5GVdvdF96Ly4EAORC0Xewt9hL8MYg95
	qs+njjFoghG9/Odhy5TDxgFGkPDMv4qq2l1R4f+HQ1ALf8dNIAPDiILq4CtYrc4fLZ/rLT9VlYi
	D6qjy6WII2+kSNNLyi7zxAqjR2WBJ71PcXiJDzbrh8Cd6slRDLqEsv3v3f75QgeUY9Oe79B84Qx
	O4Rx3xwaDt6QAuOL6nBkojDaw/Arh+bpq7Pv0L4mcOwdBI2jahDQ7YhD83inXBiESm9QA+JpIeR
	Uz4DMK4wsXEFDPNt8TcnEDc+EAj5v2EnrpFFHKAsmXbS9fEfcbJ/M+pAVINVxp4C0QoogzdI318
	Y5J43L/qzUDkWBi/WZABua8vw2zLYXpSJJwpJ9nsFT0CeYTfsikFKybbSb/f6KP7Q+LqYKEfDRf
	qk2wZuWSMvhKDLBUDGIikhnSw==
X-Received: by 2002:a05:620a:46a2:b0:8ec:9b8f:496a with SMTP id af79cd13be357-8fa8941ac26mr657960985a.51.1777572554197;
        Thu, 30 Apr 2026 11:09:14 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fbb4217728sm41887285a.40.2026.04.30.11.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:09:13 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v13 0/3] arm64: dts: qcom: sdm670-google-sargo: front camera support
Date: Thu, 30 Apr 2026 14:09:58 -0400
Message-ID: <20260430181001.9256-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

Changes since v12 (https://lore.kernel.org/r/20260331194437.41041-1-mailingradian@gmail.com):
- rebase onto v7.1-rc1

Changes since v11 (https://lore.kernel.org/r/20260324020132.8683-1-mailingradian@gmail.com):
- mention 24 MHz in mclk2 comment (3/3)
- drop applied patches (previously 1-4/7)

Changes since v10, 4/7 (https://lore.kernel.org/r/20260311020328.57976-1-mailingradian@gmail.com):
- add data-lanes to dts (everyone's review retained) (7/7)

Changes since v9 (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com):
- reject zero data-lanes (4/7)

Changes since v8 (https://lore.kernel.org/r/20260210020207.10246-1-mailingradian@gmail.com):
- allow clock-lanes, but make it optional (1/7)

Changes since v7 (https://lore.kernel.org/r/20260117040657.27043-1-mailingradian@gmail.com):
- restrict data-lanes to 4 (4/7)
- include first patch (1/7)
- add back optional data-lanes in bindings (2/7)
- remove assert low on power on again (Bryan's review retained) (3/7)
- use dev_err_probe in power on (3/7)
- remove second error on probe power on (3/7)
- add review tags (2/7, 3/7, 7/7)

Changes since v6 (https://lore.kernel.org/r/20260107043044.92485-1-mailingradian@gmail.com):
- remove NAK from Krzysztof (3/6)
- assert reset GPIO on probe (3/6)
- change delays in reset sequence (3/6)
- remove __maybe_unused from OF match table (3/6)
- fix alignment for arguments to devm_regulator_bulk_get_const (3/6)
- remove front camera pin configuration (6/6)
- remove clock-lanes from camss endpoint (1/6, 6/6)
- remove data-lanes from camera sensor endpoint (2/6, 6/6)
- remove blank line at top of binding (2/6)
- add review tags (2/6, 3/6, 5/6, 6/6)

Changes since v5 (https://lore.kernel.org/r/20260107042451.92048-1-mailingradian@gmail.com):
- add Bryan to CC who added a Reviewed-by

Changes since v4 (https://lore.kernel.org/r/20251211014846.16602-1-mailingradian@gmail.com):
- add NAK from Krzysztof (2/5)
- label the camss ports (3/5, 5/5)
- define endpoint properties correctly (1/5)
- use devm_regulator_bulk_get_const (2/5)
- remove clock-names (1/5, 5/5)
- set reset GPIO as active low (1/5, 2/5, 5/5)
- explicitly drive reset low at start of sequence (2/5)
- make data-lanes in endpoint optional and start at 1 (1/5, 5/5)
- add mclk3 pin (4/5)
- add Reviewed-by's (4/5)

Changes since v3 (https://lore.kernel.org/r/20250905215516.289998-6-mailingradian@gmail.com):
- separate camera mclk pins and move to different patch (4/5, 5/5)
- remove polarity from rear camera pin (5/5)
- remove output-low from front camera pins (5/5)
- mention effects of dcf6fb89e6f7 ("media: qcom: camss: remove a check for unavailable CAMSS endpoint") (3/5)
- specify single clock-name without items nesting (1/5)
- rebase on 49c6ac166cf7 ("media: i2c: imx355: Replace client->dev
  usage") and eaa7d46d9654 ("media: i2c: imx335: Use V4L2 sensor clock
  helper") (2/5)
- do not use of_match_ptr for OF match table (2/5)
- remove redundant GPIO validity checks (2/5)
- describe endpoint data-lanes (1/5)

Changes since v2 (https://lore.kernel.org/r/20250714210227.714841-6-mailingradian@gmail.com):
- use devm_v4l2_sensor_clk_get (2/4)
- require supplies and clock-names (1/4)
- move unevaluatedProperties down (1/4)
- disable clocks as last power-off action (2/4)
- use 0 in gpio pin power-supply (4/4)

Changes since v1 (https://lore.kernel.org/r/20250630225944.320755-7-mailingradian@gmail.com):
- too much to have a complete list (1-4/4)
- squash camera orientation patch (4/4, previously 5/5)
- squash driver changes (2/4, previously 3/5)
- remove labelled endpoint node in sdm670.dtsi (3/4, 4/4)
- change init sequence to match other similar drivers (2/4)
- retrieve clock frequency from devicetree-defined clock (4/4)
- remove clock-frequency from dt-bindings (1/4)
- remove redundant descriptions of child nodes (1/4)
- switch initial drive of the reset GPIO to low (2/4)
- set mclk frequency to 19.2 MHz (4/4)
- add vdda-pll supply for camss (4/4)
- use common power on and off functions (2/4)
- use devm_clk_get_optional (2/4)
- remove extra layer when describing mclk pin (4/4)
- rename regulators (1/4, 2/4, 4/4)

Richard Acayan (3):
  arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
  arm64: dts: qcom: sdm670: add camera mclk pins
  arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera

 .../boot/dts/qcom/sdm670-google-sargo.dts     | 100 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  46 +++++---
 2 files changed, 131 insertions(+), 15 deletions(-)

-- 
2.54.0

