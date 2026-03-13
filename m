Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89E93B4E8A
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417647; cv=none; b=QU8r0uF1gz9ZE+olv50PoUReMSePK05UwhjS07AOYKJY6F/EAaO/eNCB8RjLIo5bEJdxn5VND//sBnhedYWlD25B86+bRXgQuXfrz/1pZTZnjWMWCN7OvwkXj/sw3k5hs5+RZf91KRqf+7qt7+ar+qG7xv59JHOvw7IwYPipaBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417647; c=relaxed/simple;
	bh=lOT4+GNlLxxuDwDS5ER52dtudGIhBdpwGUH/epyYHBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cxLlRQScl3zQsYFdxViUc4qHxVQcbRNufFXt+/e4rPr+SyDqmp4Fjpo8MZHZaHUH8ZliWYuGS1IRFp8p6yTI7nX+5dxPYJvI9jdH4satT2qnZ4PF6LVK29R+PFKBhgrt9OpKk0FB/x4h3upqe7y3YBVZddUQhG4vvua1pswwsAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ndCgoXb2; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ndCgoXb2"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b976e181895so128855366b.1
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773417643; x=1774022443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1Zg7H+Y9KxSApbtKLd5TLNPtGYxeYBK0CWoprjh9PY=;
        b=ndCgoXb2ZEcpLI0KDoUjrBj0zy7lzIKOVNN6SNWuYodcuF8BZXEy7YYYi3Zcql3pzy
         F90O5zn6AQiDdmX8NY2xueo7aSWN4Iv065GWAzwbJ49Cx39WPfI6traZtWff7saJuM58
         5qU+vekPVi/CwVlxVwAhmgJMgbh5+j+bA4M0oHmOXQF8p+T+nwP+4nKUqHfqUtd5nLRG
         /MQXF5tH+X1i9X/b/v8EVCcemNGRW1MdaImOeA2amOOxegl2c/JdkLd+x5oCsew2EiVF
         8Wp9W5ylpVwDSSMIo79n2JMUFtBOtrmabDULbN9yLabcXxk0LJ/uiAnfe7EUhybFRwu6
         sYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417643; x=1774022443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y1Zg7H+Y9KxSApbtKLd5TLNPtGYxeYBK0CWoprjh9PY=;
        b=GetS2F/v1UwsWcLA/NZ4/UrnkfYTpKoCNrY7PfGEjUCFlIZnG+rRcD8fvVAIpx0OwT
         lMBGxNJJH/sarOhrYtpnk710v7NyQ0JKQ35lqSJcbANpGbi/cESiIerUR4yg3rWXBCI2
         vdwzClZs6RYCW1eT0Jx4uOYiaglfUTaqrTMx4FJSheakwz4CwAqPd0rUNN2qLqwWfQpL
         BTHYDv8X9LAjWdbAP+wjDnJAoD1M8RVi9o9zmVd1jR2yYtjlWCOXV4ofkZy8NIS7gZcY
         YEkkh+6lo8ukpJ/4AtzxWFzJkrfDP+Owg0CAW3xGewvCF13/2WQePS5bZzms3N9yRFvs
         n4fg==
X-Forwarded-Encrypted: i=1; AJvYcCUuSXMyanveX01pQMIj2SwF1bodYpZzFUf0Jd+xh8dK16zEHSXIxfOdGEEFuToYZ8yYctgkIxYVWT+8uA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+0t8SArJb/ZYzJca4xRYoxHrHUIg/9vr9wsG7VRNVpeM1VmDl
	mlh0jW5WCFc8NvZj7hlPIsQbbWS4LWmdiOnIaYSn1lbGWTNVsxmH7KfSiGzFy2DENMFzWn8r0jy
	c/1/2
X-Gm-Gg: ATEYQzxTdVCSvMn1aq/PZeqH75y7Oz2ux12UTDbKrGF9QXW+c30hbfDRhK67jOKr8v5
	CMmxcw4mAfMH63N+IvHy6CyfrTp6xVnqWKPAsdGgo2VE+EbajJqVitgbOzJZlkhci3noP5T1UCt
	n/rq1w3ZB/YNWZJzOtbJiKs01DrLsTiigM9MPf+FMAEIVDBXoL4hixnB21PCFcdtQ6vFd/cGfoy
	t8epsa9733vqwjmmd6+at0SvlJ0NH8YApXCcnAcFddpFwiH9jSTIx/BlZ/8Le5IqBxuF6aWfyP2
	tOAtCPQAZlyrrfmXT/EMGkMn5RAuqw6id0U9fNqrgiFaw5X1eNGtT1e73uMCRXXW6FdJ7d6L63P
	1pQGx3yJ3SazMt5/th0UZAV0SZQLtqh43gBYsqPifJjxGuqnk4Qw1Rh0sWnly0HApW7PsxVaHng
	vfJOUymJJHr7ENg8O0zxFWX+O7mMCS27TU+PLmLIvFOxZ8PADSyQFzrnPA363jQDlh6ulJEuTdW
	Ag5UPUNnkO3dpPm
X-Received: by 2002:a17:906:fe43:b0:b90:4b42:a982 with SMTP id a640c23a62f3a-b97653ffae2mr226821866b.41.1773417643100;
        Fri, 13 Mar 2026 09:00:43 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fbb94afsm1397100a12.4.2026.03.13.09.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:00:42 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Mar 2026 17:00:39 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add front
 camera support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-fp5-s5kjn1-v1-2-fa4f1c727318@fairphone.com>
References: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
In-Reply-To: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773417640; l=2537;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=lOT4+GNlLxxuDwDS5ER52dtudGIhBdpwGUH/epyYHBM=;
 b=xccFob+A29oD7i5aaUkyrNGJa1PukC1guO5m8Fho7wLZ5EgijdQ72vTWlBrlqHEcaUrmAvnZy
 a3mCAWwGHrLCTgLNfrsuCS7oOkyCKoU4MYb+gbLBHJsJv5REO4cNx+Q
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add and configure the necessary nodes to enable the front camera
(Samsung S5KJN1), connected to CSIPHY 3.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 54 +++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index c9c24c36ba7e..f00a8f3e7f6e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -626,6 +627,24 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l10c>;
+	vdda-pll-supply = <&vreg_l6b>;
+
+	status = "okay";
+
+	ports {
+		port@3 {
+			csiphy3_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				remote-endpoint = <&camera_s5kjn1_ep>;
+			};
+		};
+	};
+};
+
 &cci0 {
 	status = "okay";
 };
@@ -666,7 +685,33 @@ &cci1 {
 };
 
 &cci1_i2c1 {
-	/* S5KJN1SQ03 @ 10 */
+	camera@10 {
+		compatible = "samsung,s5kjn1";
+		reg = <0x10>;
+
+		vddio-supply = <&vreg_l6p>;
+		vddd-supply = <&vreg_l2p>;
+		vdda-supply = <&vreg_l3p>;
+
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk3_default>;
+		pinctrl-names = "default";
+
+		orientation = <0>; /* Front facing */
+		rotation = <270>;
+
+		port {
+			camera_s5kjn1_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <700000000>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
 
 	eeprom@51 {
 		compatible = "giantec,gt24p128f", "atmel,24c128";
@@ -1332,6 +1377,13 @@ usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
 		output-high;
 	};
 
+	cam_mclk3_default: cam-mclk3-default-state {
+		pins = "gpio67";
+		function = "cam_mclk";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	mdp_vsync: mdp-vsync-state {
 		pins = "gpio80";
 		function = "mdp_vsync";

-- 
2.53.0

