Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6B6376497
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 19:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986235; cv=none; b=sIUWJhFuwn5wKq1hWY9JNSS7Jrs5A90DRw79dNNvkGdfbpwd/jV++BLVwlO29JrYlsfW4k1EVoYXq7DXE4nL2dW5ZObfYBG5rquYd3nbWV2u8JsgFKciQqGNOU+m/kPHxyMckGF8h3S6Be/OzRffIhxEbewOy3lKl4vS4dtrCBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986235; c=relaxed/simple;
	bh=kJtaTp0b2xxkENPXxh32EK3QZ9vMlk40N4Wgu0tyQ1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AfHuzkR/4Dit1krgMrmeafA177ltN1DRPGH485EHjms8D9eRcz+kFX6U0YyYiyRxPb/9svKxaLlE5tR462vpWCsTVmobleO9dZ3BpT0Lq0bEW6TzynpeaS1kQeLSj3tAFCgKaQbvQBBfeGuLD0Ps4WXx5K4rqb35w9P14s/3ioM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pT6n6T6c; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pT6n6T6c"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cb5c9ba82bso1213044785a.2
        for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 12:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986233; x=1775591033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q8RpNUxtcPC2Ov0aBHol3C9JLTY+x8Fx+uA5MWYWzms=;
        b=pT6n6T6c8Z+rCjInX2b9vWMzjPLKOEMv+XN7K7tGahLbZ/QSkVRCEdXdwpOapUXPyg
         8FSE+OAX9nWrQOhGQUnCsxJgfzXjMAYJYhh0TocjitjQFEdCkZy2gqQ9l9SLcnvh+yKX
         ADfMdBZ/D5iC/bipJ9ojBBlIaAGDob0kMcj4JvpseB4iSgdNofWe9YhnnGKgOWXRYkZv
         kSQ52KXIbIZBYeCvvjUKorlUgLL2dmDqnnWwyxU8ZelsxxXvQwljnHwHHxV9drcCIxU5
         CosZkqwprGqiARFjlLEEjZYUUlzwMYPpgn4XRx4Qht8XJF80GNo4TjQ8DIR75MSy+Geo
         kKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986233; x=1775591033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8RpNUxtcPC2Ov0aBHol3C9JLTY+x8Fx+uA5MWYWzms=;
        b=NGBqltd63VPlbaHFVaaye88U1zu2VHAn7Te6OZPPoeXN5zdF9Un/kjQuB+cqZ5VQiq
         gMC1rddrknnQQx3Vxfr5VuYvN2FUblSo/60FublpnmlyI2EyXbrTgL/Ff058xo0Jba55
         Df4HhhfrcUo/mgII/cdcP0OgKbNmRZOVSTI7Xil8b78hfDcSzC+CPMd2fhuHJfMCsdsh
         BM9H6Da3VOeuOnp27XLG9MDH9Cw8p0WZMMV4jg48p2Az1EXL4dUMWTGUHJ700rrkxeh7
         MvMCz04E8rDpDGB8aBpsRg2ADtUP1Cg56ZQo1si0KFJ9LzB6SsSpf2fQSl7Gf1j69yvj
         tZQw==
X-Forwarded-Encrypted: i=1; AJvYcCUQxiLFCk854qIp/U1wFWzxWTexokl0mIcc3EucLPJxmr3hu4EBgqzPWCBHTSYwWXTKJ5I/vKTIwCe3SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFuDmbvluW8SM/p6PVarlROHiZbzrSniXf+STkinZgFtigxMQY
	ykD+jBfoe9169BaGolyXE8406BMRVoymIqeW4Tf7tVFGt9P6C/K5ZB1+
X-Gm-Gg: ATEYQzzGi3qKROG6YHGobXZx/xlXej/Mwjfk29tJVvN05BJjI2w/LUUgbe58zg1Fe2W
	SDFpKZukIOO8v6g0OQG/BNIOdjA/FWRHEZWThlb9MVWXiBss4yj1lPBvAvyw2yNaW3cItrFOp0U
	b76X5gISmDOa6OFi/qCY6EZAJJh9r8XonDVNRufPkdE+S6CRyJWmfkBFehfcm5lQMCgIN+XJ9iE
	NmNiaHWiQtfcDzK/LQ4z5i9fgvX0HqWfapL+FwrCBt/2eHn3p7lN4xI5V/o6gA3Ua3HAEgcrX7L
	dtsjP8zA3LD27aHokm+DiqUgiMmpS2lyAD9qQ8lvcUZJrizg6iECFiM89UsntO8ImdZ8f5KZiGJ
	rgEJMDXlqdYOQOrJqWsS2V2zrABgguLHcmaIp1UsuG9vYRdzmFWqhn2zpletT0LErtXVNDRcEdj
	pYWuzUT8zIWpJ1RIoiYZovO0zNXx2iCpEWr2U=
X-Received: by 2002:a05:6214:2c06:b0:89c:6ab0:3744 with SMTP id 6a1803df08f44-8a439d8dff7mr13268696d6.47.1774986233262;
        Tue, 31 Mar 2026 12:43:53 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed003a918sm101099246d6.44.2026.03.31.12.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:43:52 -0700 (PDT)
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
Subject: [PATCH v12 0/3] arm64: dts: qcom: sdm670-google-sargo: front camera support
Date: Tue, 31 Mar 2026 15:44:34 -0400
Message-ID: <20260331194437.41041-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

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
2.53.0

