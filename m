Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831322C236B
	for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 18:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572569; cv=none; b=XvKDGztyQku71vWe6sEXws7S004haGXgPQI1ZHX0w4C0p43KpONkE1qVXrP8Vp4g0HwwW50Yx95BRiAOpMZxQ2rdSLlxkVs4ZQ9Xvjc7V5yMZvf9PntctHLx4DIszgLgaU64stF6VUgFAQn3xNQVeGxcShp2jt/PC4ifLxUp9sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572569; c=relaxed/simple;
	bh=ahOXd49CvxGz9ZeJi/DF+g0yvx3WazJQtMUYBMCZeCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jr9BgD+H93SjBsY4ikMI35CTIqz8w2N0BnjsRF9Nl9SIhxfUMOWCqUQb4MUDg1El4VOxPPUy7+5e1fExTS4GCRP1Yzzu66bgzrzRVmH8Gibhp6ZSUIbXAF+Q+45Jc15NekEHJQLaH0iv3+w9xE54/e8hG7/cvfIW5tlQBgihm+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGoDkEnj; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGoDkEnj"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8acae26e564so14135126d6.2
        for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 11:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572567; x=1778177367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzDYNSmj+UyxcyQfn/KDw8OdpCfyjj2E+yxdJS6VrfQ=;
        b=RGoDkEnjBdFZIcHUuZhg5ex/5Hy9T5y9eiMSkLMTATpCFcxXhPQ69XvR3APU67aY9B
         ix8fE2zgUBfyVhm8IB5IyDOGSCN95JpPyXNUPl0j7xmqZmI/AwjjTvzY2AP/HJLMz+Zi
         6J6ipRFOjaEePO5ThSXtjsJyb1/Kbef3GjBWnb9mq8M0VPVqIscgfhaQKppPXXv9Mcod
         K7F66COj/CJoQwUrVHbV2mine+IGn/u/iDmu57dGhOhDyVRPP/yQ1jwg6I+wEMnXqtMs
         7OTZWl/UXEsAeigyBR3es74c5W0KD2bhtx8+8XX+nUEl9+4u4/AR8O8SoqJubkYYHQhu
         5mWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572567; x=1778177367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nzDYNSmj+UyxcyQfn/KDw8OdpCfyjj2E+yxdJS6VrfQ=;
        b=Sztmcj6YP/8WCCUb6jJAkH2DJqJQ6p5HsWv+006GQN6kWPGL/cAj3xaTNK6D06TkCq
         FKevaTZfM1DXRdIDWAoRQ4xJOD8v84hLVw6pBl/h5G0YCb3VU9h2vTfj0kw16YDNiz1i
         7BDJMMiEn3tPaxbH/1mISKKFoMPx0AcU3egdRZPMZlKOAJ1IrZ1Rn0BaKRKgiN+pOfQj
         FBoPXiTKRGC1Js7fljK1w6uUBX9732n78WKjn8SB3ZydLJn+YGQkn0YCDfV3lk5L56oj
         vPxiYI3q6R+mLzrz/j35i4C8uxqd/BVepxyViDQCX3WzZ/KS+NkHJW0Zu+hc23eNMHu1
         vqkw==
X-Forwarded-Encrypted: i=1; AFNElJ/8ucao6y7JJ8XuNavwjWXRVyrkTVL2BEzTF+WMEKlxmcNVKpd8Acz9ZDSAfj6RSuP6cb2n+fzixO0SgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyedUakuLIiCaA8vrnDDE+ywYndauqG/3IJdpA856beFBiEfeDs
	plPEZdLM98/weCZNx+6ykNUk42Qg89IVmyk162OfkDqvzlt9XAjVUioJ
X-Gm-Gg: AeBDievx+E5zuiaSuf20dxkQuqNv6Sn6T1dSoFvSl/YXr09M5BgioPmQ86L167Wcrdf
	vFzjeJTwsYbzzflgN+faI1ecrNzw79gr+WzyRl3MTV3rN13QJilMMBSoPM+2y5fWucDXC6yDh76
	COHfHNcVyr0jxlsjxIMgqKnAJBZGmsUk3F/RlhJt5cs+yGoLQB8bT3dEeFo1XWxXfYTL/08s78M
	4/tnxZhKIXi88wBgmPovQRKE5MCeuAK1OAZzoZ/8SzvcbiHYFvPhhqVLNqhJcMT/zJvyDyrNN2Z
	j7cGBQEYA9d3NiE0YFeMXmErJMFb5WhgsgPv4COqdSuzRJb+Edets3wxzSLZIQhN1KPvxA7FnTl
	T61Sk0P9kr8afu6YW6Enee13lM9nY2PemPGpILvXDvBOjErASVmqp9KhH0P6kI5Yf8LXMgQyJ8d
	g99ghRMKjmndWocZu5oxiqfKdmSoO/dPX5modd
X-Received: by 2002:a05:6214:b6e:b0:8ac:a4f2:69d7 with SMTP id 6a1803df08f44-8b3fe733bd2mr65212836d6.14.1777572567556;
        Thu, 30 Apr 2026 11:09:27 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff301ba6sm24911646d6.1.2026.04.30.11.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:09:27 -0700 (PDT)
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
Subject: [PATCH v13 2/3] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Thu, 30 Apr 2026 14:10:00 -0400
Message-ID: <20260430181001.9256-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430181001.9256-1-mailingradian@gmail.com>
References: <20260430181001.9256-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 1613c66f92b3..e13ced9479b7 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1207,6 +1207,34 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.54.0

