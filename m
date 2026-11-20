Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190103;
	b=X4qCVeyYTDP3s4VJYXM44cYaA1rYv0KXLyEi+/zLQ1xI+AVkpos8M8iS4Nlp3POKcCF/
	 zyewnMwwQcLVlAztNKgQyKq3KfzW9lMAYOrgnmjCJGgMAvo9JL/lGMlOP3+KekSdbyET0
	 1/MWfkw1HP0UHSWpgQO18TWiBuWVeI/XJzYeLY71Kk9QG7KpeIm23oaqxvv5q+X1A/IGs
	 S6k20B/dJiS1uW354KLm1e0EK+rbQWNEcd5Cf1ZedqFdiGWj3ZB5Ws4n+xVtIhzUQScbi
	 MjLHREA6FXgzbL9rjOjgwHGtgeWLsIvYCyaJ/F+JKX4eNa90dS0OWU/7oWgpAVs/ujQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=grKFuqlZy/vF+EZ9KT+ynP4RyPsh8Pe65v03F3LVnyg=;
	b=wRM+D38koEiqO7N9xCz7Jj+KYa/twDTEKxjBT06PFgG6vHnSrze72MZC1s4YnV0ulV69
	 A7hyXFRac3gtABtiHiJi/AKYzDoeuxYbPZmrJEoK92aaA/zqcJUFfr/sxV8kabD+2Nf4I
	 r3sPL8RQ+SEI+ulWBWoC9KhXJPEr3TJEwtNkpDHLN+nm1dqrli3mKN8uxLkn4hK+4ede/
	 4F/fhZpbDo6j4/zezQkUifp/WN+6kzPRL+VuO9kb8RxZqstewwZMkcYg1Bk5nUJWAkp1Y
	 +/BpCV4lb4xX6uG7L77kCsUvU7j0xssuvf17J5JUgWB0uYjXSF1HyO4RTfleNF+QtBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2kOcKCi;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B060A6F41
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 15:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA2B060A6F41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2kOcKCi
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a32576da88so615938f8f.3
        for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190101; x=1795794901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grKFuqlZy/vF+EZ9KT+ynP4RyPsh8Pe65v03F3LVnyg=;
        b=s2kOcKCiOdhayP7XlDN2K+jTO88jXK32Xj8Z2koNKcodABBvPJzDEE4lrX+uH+BskK
         0j3ep3cMpa603H22Sp9sjtiY5cc1X+dlyc2t1VLetPq93hcTtVn7qjJY2XO0nzH2u3+J
         jISqCrmykUqbgdHqNpBZMZn42xrQi+HUo94jrL0T5wA+C1RQjryX/goit+z12GCpIuyX
         rTN6a/b6TrCLyY4Tnt1HRXy5HelUHYJQ+iX8L9yCnRYQB+5LEeJumKhULoWd8pZfTJsp
         jAgjEBkCFcppCTLmOUI4cipO1YR5A9A8vrYTly24tBfFcIjv4eHRHrgGaKouh/fAOe77
         Egfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190101; x=1795794901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=grKFuqlZy/vF+EZ9KT+ynP4RyPsh8Pe65v03F3LVnyg=;
        b=AlO/RWTW3uHVcbbd2pD2YIYKZEFM0Hdps6b2Ahbur8KOXiJ386eSY8wKoZsw0LPxyO
         1di0kHN7pHpYxKzasMMt0n4vB/qhO1Xw0Kvc6os3riGHp/SaJbobyDRGuKU+5dsXpvm3
         ObyWxiOY5Jcbtmso0aruxHtk8jpqk0eQK1ZjmZsz3B/m7YMWrg8eiI5T8T5S3I96gnfY
         JArHH2X5nvCAKxXUiQrFA97TXYAYo/M4ix5uhiACHkbtI9WXye9G6MH8gq989ZNwjEUH
         bYcPhekO8tx7WYaVqLV6NHofU6X+nZwMy+pg26tU4M7j842WtLifhRGGcUzzPRp+XSy0
         psgQ==
X-Forwarded-Encrypted: i=1; AL+hErEPnfpfVLuE8df4b7kxAPNxcNkCMg6ArbBp0wF1M59lp6c52EpCsIbUnsypmDp9UwC4hfPxOi8j4/ekGw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9YnODatIYI9S5UFAn77fUKDpPGhFZt2lMALAox4G+o8G7utPGV
	gm4MMFaQSsoCvFI30WysaArH/kX+nYLd3eT10RwyTUMK6+XOzNaOIpZH
X-Gm-Gg: AYBFou2zQScqqs5viA+evaAa4+BEPCfqRjTefCTqOq1d6ibYqWhxsbltNRhaefIvBOa
	NTMGyadsvu5s6h0dY3AhmqivAJPUiSW5HQWz6/oMf+LoC5omZ8QHsEzWxOy3+cF5ihbVL8VIXjd
	R7ILFVM/LGAdNOTmO8bVnUk39mD/aE1+qV7Oh1PxlKIZ5JeCJgjv9VnjAr6oACUV9Bwl4HxgwGO
	ujBVXPqtcsEiRn3Sdlp0rOUENTofRqVp90Agn/5AW0h8tQTDgoxCzSdS4ikGZnw+vwZQKIQwPmL
	YSJcXVz2jJGrmhgDx+II9KyORtos7WJjLUxwGAY/ICtpOpAgYb3b4afysnnzLI4WydsjCCN266S
	gGzGPlcvAFk09llyp2ivI25KAh+q3JPAEKNX15Byu3uEv8VqMZ/85PiewcldUIVPiXgE2fL70Dw
	P4tURqMucfzg0igAWBBmMHX3jjBfiEUh8pvcoPNKABR1TYFBzsiIzLmDI66b/EEWMHDn87LAExh
	NXpYMVltSiCZSIHcChoSyxfUruoUbWUhjXDfQ2AWvA63mZTCU/Fcr7XXlkMnEXqM5R3xsy0wvbS
	HMi9tG5EnV04QTM7AKUXjza3MK9RkLqD0HH/CsPgv2+vqf3viVqpaZVbT/9OMmBdBZ43WSNB5Eo
	=
X-Received: by 2002:a05:600c:3e0e:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb88929c63mr74999345e9.18.1795190101297;
        Fri, 20 Nov 2026 07:55:01 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:55:00 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Fri, 20 Nov 2026 16:54:48 +0100
Message-Id: <20261120155450.7719-10-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the PM8150B Type-C controller in sink mode with PDO_VAR up to
9V/3A, and connect the OF graph endpoints for USB DWC3 and SuperSpeed
QMP PHY orientation switching.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 6f00495d42467..16ed6b3871374 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -555,6 +556,44 @@ volume_down_state: volume-down-state {
 	};
 };
 
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "sink";
+		data-role = "device";
+		self-powered;
+
+		op-sink-microwatt = <15000000>;
+		sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+			     PDO_VAR(5000, 9000, 3000)>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				pm8150b_typec_mux: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
 &pon_pwrkey {
 	status = "okay";
 };
@@ -659,6 +698,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -673,3 +716,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l18a_0p9>;
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux>;
+};
-- 
2.39.5

