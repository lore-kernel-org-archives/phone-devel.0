Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133252264CA
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770812341; cv=none; b=o6dprxvoH7qjFYI+aKNxv/lj3C+b3TW23OKcYISlQqg+kqHG16YcxLqkEz1B+t7Z1sKxgZtpZ5KOxKRlMZoQPC5lTLmJsqHel0ryAiGDQmHpKmAhAfJKtILlvYrwlCbr2767YAZC7b0lZrKp8yXg9UcIlII2dOuie8T8V/H95ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770812341; c=relaxed/simple;
	bh=9A4gWGZFOxwDhK7ZmTb9tedSw5n3x7/bEPDL9A0lbN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S2KPJJpMKeEoJfKrIgn4q9O74UgctcKUHXM7QVkn5nHUvI7XtnYaxJ0RkhlIZek9Fsz5YKIM70y5BDC/VOCoORPCj4ntDYtEz0CaXSM81r9E4iH+SMWWLroA9Zk4D0A2E1FgjL+SrjArcuJY/yTTzoSA6mHUYNgJOrJ3n8n7vpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1bbpVcOd; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1bbpVcOd"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8d7f22d405so264169366b.0
        for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 04:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770812338; x=1771417138; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6dzpOGAu3+rtyHx1s4OVXpmAjZ0G8S1KZFSUletwwEc=;
        b=1bbpVcOdJgXnenLSGY1j60NFJtAfyqfoGxLb/LxMazckaC7hNbwoZMJDhKUOS4xg/o
         YNw3oSB2SarsqNGGIjAsIctEe2hgl9QQN3JvMaYXTvyQXa7sKog90SB9J2a2YdkE6n06
         qssytXNV8iQ4A3abRYBTv+HHnogsLEiVjkFm8v5NUD6GPEonxqqUqDexGDUVHcnr20vS
         DnFMs+HggCSEruCcrl9+I2kmskmSsWy0lMzXRuALhoAorZ/TDSiBweeu/Co/ee4lwbfu
         Mj9kLi4mFViSY2Wi0sH0MbGoxvXGv326fCkz57Cv0XlzfmH4kDWSNid6Ll99gcrhiS7Y
         88SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770812338; x=1771417138;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dzpOGAu3+rtyHx1s4OVXpmAjZ0G8S1KZFSUletwwEc=;
        b=YlNaguwY8E9a/OBsmS5x3kibrhvk3djiL3eCQh0oxQLDNxix23JPpzrQClO3oDeq9C
         CwKU5c6V7u75EPyQ8vehwwxDiVPdheYBKczyXN94rIZ+RIJyvGIP1FAMXCLcSzLPWWfO
         XZLl3LmZ9/FLHIlQFSb+71zMIUyWpozC0IXU4zxJmma2zIdSrJQf+YDNCDl83H1Aerkd
         D6dE4RXddzhc48Y5bHqULL98X1zBVGs4oyFFqPqrHBuV7wi9WFrbZpCwITqi3Ci4X+tw
         oef5enn3gmyD/9ntcbLleaLC08TebRONbF5ine2oqzS7b9Ma1Fb2m0lPq/lf8Cnb6XOo
         0nLw==
X-Forwarded-Encrypted: i=1; AJvYcCWSN/dpLgRnKQqKcCJDxOEMD/JHHkOgD7VBHIFKJrw0d4A/Z5//4JoUruyLzClJtzNODlIuc4931E3ISQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyNuarLSTPziFuxK7nPwMB8a0e+tz4Ew//y+wX/u06n7MZM28S
	KCkdC2khodMPiv4SATwiYwGkKrbFlaLgDZm84OyCQZghx2JJp9ifPONwcyyx3pPHm+A=
X-Gm-Gg: AZuq6aLD1CI0zyWTLdL+/WSsbqGeIabffjWdq6W1ldaZJkhjG9fvqOHKwvxvSb5ICpe
	ct8Sku4TRl2YRQGN/v8/bp/nJMJVR8hQsf8ni25aiGeQtgv77jeYe4rl4M7FadkQl/gIHuyCa+i
	1L0AZelwWRC5U2X2jM3SmR+1/G04ZKTiKT77jJBvAAjiV1GifSCMPvpt7T7Kyx8LpplRDZpc6mR
	QjYTt1oA+W3z2T7QBC6c31KnMr+V4uWJFrxo+kT/ZX+gUBygbUaGFQRe2Y3EqdrEZ/c4i4rP/fW
	FUI5GLimpAJDgVUJWqmrAXu53Z07O+dA5LojsHLB5Sgz8Hor4zNIs+eQrLIMTTrk25Q8dIcqktB
	4RDe+GIgBA3pq0ftrmR+mx6orTkyvEDtYXf/Ge/mxzDB0hC26YLWHG6c4ujCHSzEOdeMOjUaY9F
	DTa8T2B/V/UqXaVy1wkN/99a7IhEhjjeGlfi4MrMHAkBLSUHQVkmwgXUxIcycTWf36VaxV5xZSC
	+hP
X-Received: by 2002:a17:907:96a3:b0:b87:124c:5f65 with SMTP id a640c23a62f3a-b8edf415a37mr1153663866b.51.1770812338337;
        Wed, 11 Feb 2026 04:18:58 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e9d0212sm55791066b.26.2026.02.11.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 04:18:58 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 11 Feb 2026 13:18:57 +0100
Subject: [PATCH] arm64: dts: qcom: kodiak: Add I2S1 pinctrl definitions
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-kodiak-i2s1-v1-1-b3a7fad8014e@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQpAQBCA4VfRnE2ZUcKryAE7w6TQTklp393m+
 B3+/wWXaOLQFy9Euc3tPDKoLGDZpmMVtJANXHFTMRHuZ7BpR2MnrDtRnYVa1QVycUVRe/7bMKb
 0AV8TzMpdAAAA
X-Change-ID: 20260211-kodiak-i2s1-39effbe18ffc
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770812337; l=2016;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=9A4gWGZFOxwDhK7ZmTb9tedSw5n3x7/bEPDL9A0lbN8=;
 b=pNemSz99lPFip6qwzHK563vh87rqx0FItMyLu+rIfVoSahTuANBU3u9aIFLUaX4j7Gvg6lO9+
 iY9QmGnbEmVBMvBSesRH5C+9aH6T2fsWHDzbjVO87w0AR8+/5cYHceh
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the pinctrl definitions to configure gpio6-gpio9 of the lpass_tlmm
for I2S output.

Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..2e53e99e86e4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3036,6 +3036,58 @@ lpass_dmic23_data: dmic23-data-state {
 				bias-pull-down;
 			};
 
+			lpass_i2s1_active: i2s1-active-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			lpass_i2s1_sleep: i2s1-sleep-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+
 			lpass_rx_swr_clk: rx-swr-clk-state {
 				pins = "gpio3";
 				function = "swr_rx_clk";

---
base-commit: e1a106754a75d08a60acd0d72bff339d7cfe8c3a
change-id: 20260211-kodiak-i2s1-39effbe18ffc

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

