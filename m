Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E2722DFAC
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564940; cv=none; b=P9CbrCr1ZolWzTeHbr3mooUP83woBNPdRHQJooL1Y0dbBgY7Ets8K07WcKma1LNpb1sPljmMCCbkj9+0FcQOWC190MJYKEirwBih0MxfaWysSQ/h8KNH5WYbW2iMVoMeO8f2POdxlnZC5TOhryaECsoY6pqfVJnWoFR3WtWQSs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564940; c=relaxed/simple;
	bh=58uLMRigN/3JwTynkd3IJXvhFWC8Y77pDi853RHonh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qttlLQtMWYg9ZQzLTW9tiFahla8IvaG1gx589WgpZJWtMzrc3XjOEYMb+y+714UCR9DfJlLGoSOJZNRcCk9pVlouVwle6dzKohBctQk75VJRyxKIBfLmwZmC+xYXA3wLK9D+aqN10yoh3RRcOJxp2d7mNderUTJubK4l4OizMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DJec/nlD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DJec/nlD"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a064a3e143so903477f8f.3
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 00:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745564936; x=1746169736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEyz2zzKEn0q5ufQceQ5JBHjB/BVYFE6FtYDnEgCLwQ=;
        b=DJec/nlDuOzbT6tzzSUEc+pnV3+44w7XL6YW3xXbPYVHt78nBaFWwlqPnH7T/Om+U/
         sHBULMD/aeBP8FTF6PgC4robFushIfdK9aymeFoymFQNBw28STId+/iCpeN3bk3ODy1W
         GUivnU3XKtbq+R3A1S1wb4ANCqlav0T13yolyWZxXNRUDgXlfW0fyuvTMzH2wYZVB7Fq
         q69+k9qHqlRnONJqnFbJho3e17fo5CdblPfOZem5fsGi37oXwe3j6a8eYGTL/487Al5N
         7nKkaPbfJlCBXxLIMmBA+0F8F4O/z9/o2aLiuod1etQ3Y4liPSWRNNuJojC5w/d0jZMh
         WnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564936; x=1746169736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEyz2zzKEn0q5ufQceQ5JBHjB/BVYFE6FtYDnEgCLwQ=;
        b=g18+2BAQuBX3P2OEVyh5TD8AI2vewso5F+XnhTThNWaAo0gD2nwIfrUl14cgfJHLkP
         cTpS1sOGwJPm01fngifUYqZ7fzUBU5JnfYJc2E1DHpYuwUB6Y3jNaKFoqfrczjzwwJbb
         s90PQgBxiZkyak1eIIT0Wc2yFqhR2TqE5huCIxWC7fjNmrL9gMNhdSPw1sVA7AJ5ro/v
         Sa82vXywRcjakx+SxH5f//FeJ6KONG39nHuRJ1rJleUfp2lW75srZ9elaA5dCfYM+VZf
         8+u8UdvYhF/GPeZ6NMnkMtvYClsa0EKqgabmRf4jnTvDI+e+PkKosohFmR9dabKG3Jo5
         cymA==
X-Forwarded-Encrypted: i=1; AJvYcCUuhb1KVbp4PZB8LzafOM0YH2kw5Uk0+KnUZPr8K7eZ/WcO/l72iiK9drdJgv/OWI/7xgvPD35lx6lS3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIv2GaY37SDki8RNYKp2liPwR2tvJfe3CtXoWne/l/O/Slz8AS
	uzm3WEMKIyJfHIcwfChEtJXLKq1ApxjxXBCHlZi6iEzf+M2ZfOmaCP6XN9lN4So=
X-Gm-Gg: ASbGncs5VRxQbZn3XrSFVYAyHLl1ynguZVl0A7hnj42RsN0vTdEYqUjN/FkCeCvGNco
	t6svpA4fbfg7DRszyu7iJ/qHHrh4T4JVQPStpY5prnaDwu9ccM2AmPD9uQtJLqnBw3mraH+Hdl8
	/cFArV/beAFFtGr93K4jDlQ7WXKigZOgFHu2MQYVc7/YmRHh9pqPbsjTJBOdvsuQ5s0TmVBUH0c
	CvcMbDwBQGvlonBDE+MfX+76LNLqCoUEeiVLZyYR8jN1IT3LdkiXBVWovCKCKLByAH2C8IDj2eY
	tgyFFODqNgU59H+KjsEAkCo11zIDWz7uxcnOtxOIbpX8AHq93hy/X6NsFFAr/gb+sCg3GzUUl1y
	7UxUJnfCrRfuhpoeejB8UppzyjBYZ8IVjvJhvZrBsUJKh/J2+2RPCbV1F
X-Google-Smtp-Source: AGHT+IElgBe5hw+u3muWiAJfsgUeM4zO5vdASqmknH//4dvBar0Sn10JyEKag14v7TwSzL/MZzE2Ww==
X-Received: by 2002:a5d:4312:0:b0:39c:1f10:c736 with SMTP id ffacd0b85a97d-3a074f15b5cmr536853f8f.43.1745564936320;
        Fri, 25 Apr 2025 00:08:56 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm46202735e9.24.2025.04.25.00.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:08:55 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 09:08:15 +0200
Subject: [PATCH v3 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up
 DisplayPort over USB-C
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-pmic-glink-dp-v3-4-cc9c2aeb42fb@fairphone.com>
References: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
In-Reply-To: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Extend the USB graph to connect the OCP96011 switch, the PTN36502
redriver, the USB controllers and the MDSS, so that DisplayPort over
USB-C is working.

Connect some parts of the graph directly in the SoC dtsi since those
parts are wired up like this in the SoC directly.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 54 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  9 +++-
 2 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index e0470be9142caa4bac4285a191725bbd60e706fa..9e8f9fb57c4723a24704a8239a86c6081910916b 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -101,7 +101,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_ss>;
+						remote-endpoint = <&redriver_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&ocp96011_sbu_mux>;
 					};
 				};
 			};
@@ -761,6 +769,13 @@ typec-mux@42 {
 
 		mode-switch;
 		orientation-switch;
+
+		port {
+			ocp96011_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
+				data-lanes = <1 0>;
+			};
+		};
 	};
 
 	/* AW86927FCR haptics @ 5a */
@@ -784,6 +799,27 @@ typec-mux@1a {
 
 		retimer-switch;
 		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				redriver_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				redriver_ss_in: endpoint {
+					remote-endpoint = <&usb_dp_qmpphy_out>;
+				};
+			};
+		};
 	};
 };
 
@@ -805,6 +841,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+};
+
 &mdss_dsi {
 	vdda-supply = <&vreg_l6b>;
 	status = "okay";
@@ -1301,10 +1345,6 @@ &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
-&usb_1_dwc3_ss {
-	remote-endpoint = <&pmic_glink_ss_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1331,6 +1371,10 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&redriver_ss_in>;
+};
+
 &venus {
 	firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8e86d75cc6b4929f6cf9592a3f1ae591a19e6d78..ea87bf360ca0ac723e1dcd8ec263d0ca9a96f02e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3640,6 +3640,8 @@ usb_1_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			orientation-switch;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -3655,6 +3657,7 @@ port@1 {
 					reg = <1>;
 
 					usb_dp_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
 					};
 				};
 
@@ -3662,6 +3665,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp_out>;
 					};
 				};
 			};
@@ -4268,6 +4272,7 @@ port@1 {
 						reg = <1>;
 
 						usb_1_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 						};
 					};
 				};
@@ -4993,7 +4998,9 @@ dp_in: endpoint {
 
 					port@1 {
 						reg = <1>;
-						mdss_dp_out: endpoint { };
+						mdss_dp_out: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+						};
 					};
 				};
 

-- 
2.49.0

