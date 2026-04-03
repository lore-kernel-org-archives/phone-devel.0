Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1B537D11D
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224533; cv=none; b=akFm1wnUVKiciTcbyBLAUf+GSTUS6WfRPio3Xf89FkGeg3Uuq6CyRyW7+l3d6CnMlg5OIZkePoPGZ/aXW8eUglEZFDvQfg5dGjF074kix2a2aSO28BOiEMI6pnrGA95z35xnr9yc0ZK0rhzOzMLbl6EQUAVWF8SwmM+acfO2ZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224533; c=relaxed/simple;
	bh=WiO7xxC4vnoDFEP8yYgqIU+yonljli5p0uLIYnjF80c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=psM+2fcxta4QDhz/qNU4wp4NB/4Nu5XQdbTqZVjJlbyRXQkSH5jbTj0bh65fqcpMmWnXIOezOCM7KHU06Fjjl8R7b1EgKBwaLMSewNVhDVEuq3pPW5gBCf1LLvlew9ibRU7X35lissynnm4Iy0Wlwu9bWU18nGenqC8+Hexi5kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4j0QMeLi; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4j0QMeLi"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b982b0889d8so260617466b.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224523; x=1775829323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xu/QbQrF+RhfA92z9P5YF9wreIVJO9r1YHQM8M/36Jg=;
        b=4j0QMeLid4kOG+UcPl45sYTvbZMQn7MK59ELOOB1UTelF9wBWCF9eXKLcEY8tuyQvt
         AKiX6dZmt/TG+9WQBiIfw2iBRZK/3UNmHr/Idx0N6lUIPfwgGPDgHzk5iegkISC3dCqE
         /YntSiHddnLvw6fXA0wgoBFiTXGUEYJume8Bn/fT4K4Hz4n1s7c90rcTW2rpRzw+3SPJ
         brGvhfLo30ADRWBM8QVzpERzVj+t9WAqunOC5II1wrOqtDmqkCgF39AtJ3poq/i74lvL
         q8ZEDuDouyN5DoM+NtfmepBTiL9d/+b3DVgHTng+Lq+PLRurdwtB3ZLlMjCbN60UeuDG
         6Iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224523; x=1775829323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xu/QbQrF+RhfA92z9P5YF9wreIVJO9r1YHQM8M/36Jg=;
        b=syH7z00/DEdjdQHA/vlLW3+o9CAgIWtWx+3sKCqU+7LVxqL9keiRQBFYRQIVSdNemX
         TiNTgBP1K2pP9Z0tqil4s5sWfAtk+cGS7lzddQBg5QU9uTY+sxg/LGmno68UbDdQnunJ
         x/GaiJplQSUEmevgEJNRULsvvoT7WGoAjEyZ5zTzD+GTuxvjhPoEcfOCP5mYLE4sibfs
         uDC2aCBkjX4fWt8+L+mPG9YTpGGlvuUk7oCnoRsTxWLDT/6mam55jaiGem4rNt57WzUV
         4+udou+7Ypsz1BK+CouHVXVY9Q+PJDg7P+5fiJWlGj7M9Z6wPimmRXP7A1YndZ3v7k+j
         nUoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2UuWtCOKfUif/KA7YNOqUt+oyBZuJdi8uV/Uij709ygVFFlX6pfj79a7H85Hga9smfWUDku0bMqucHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmPNkVovXyBx7eemMBMNSnWGrJcn6OSk1tIGJAjkFkTbPPOYcZ
	Y69aUzTTU21EV/5JH0VYTkbV1CSuMX3q+PYdn3SIe7v8yy+RVNwQrnQYPR7mP3PKcnM=
X-Gm-Gg: AeBDietqi1wY31i2XSQbV/hARZUdAEHo7XeI3ZrOGUDzTfxZCi+tlCu72S4FbyTjOec
	K7NBQt1HPhj7uYSVB5LigPZ5nAcLTfDaFle6exetWCJGJvZsksZxS2p3+LG3Ch8m9q8G4XP99Q1
	d9R5H9iAZeEVVeCiVwYCasIGHYF+9ARnseAuPij1LTKR/GePKUo33be3+4blUgpSXK9+/ohO3fO
	2wbwDQx7MZil/meQgv5ArLXZn2KCTntweEjoxYi03imofpEcdBBa2O8GvyedInfjyRVlcCR9/V+
	AOq2CdEk2SuPTQJreW5Bh8BaXyIa0CkoHnwDOdfO8av3Pp6vheojDZYlJCrjN4uKZf4PKyUx8F0
	MEi4bUcONmxVmiKUmEQ+Je1C3oTGuOzxSrsInKEsinTZUvDkYPOPs9xM/Jcn+Q4ieqhRQQ17i1i
	J4Xpxy/BstAVqxGA7ugL1qchEUJ5/B2lioQo4X+rxDBFZqnTzH3AOnAGveTE5I7B3j/kGsvy0u0
	9jwJdXPvUn11EZROr6eg6FZ0HURfqxWtIuCjQ==
X-Received: by 2002:a17:906:6a0c:b0:b9b:5164:906a with SMTP id a640c23a62f3a-b9c672a4f0cmr157218266b.4.1775224523388;
        Fri, 03 Apr 2026 06:55:23 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:53 +0200
Subject: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1686;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WiO7xxC4vnoDFEP8yYgqIU+yonljli5p0uLIYnjF80c=;
 b=9xLHPNbkt0sV/SMYIy8WN5UbmrF1+a9f7EhbS1150zHQgK2ZkM3gLMQ3RUV3bSz9ea71I2aJt
 R2qV50g74/zAGlFDurH8tXrwoGm2tG7BDnEuEDClBZR1UMTaig0kdCg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure and enable the WiFi node, and add the required pinctrl to
provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.

Thanks to Alexander Koskovich for helping with the bringup, adding
the missing pinctrl to make the WPSS stop crashing.

Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index db72418b7195..d8ac495ca7c8 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -242,7 +242,7 @@ wcn6750-pmu {
 
 		clocks = <&rpmhcc RPMH_RF_CLK1>;
 
-		pinctrl-0 = <&bluetooth_enable_default>;
+		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
 		pinctrl-names = "default";
 
 		regulators {
@@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
 	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
 };
 
+&pmk8550_gpios {
+	pmk8550_sleep_clk_default: sleep-clk-default-state {
+		pins = "gpio5";
+		function = "func1";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <0>;
+	};
+};
+
 &pmr735b_gpios {
 	s1j_enable_default: s1j-enable-default-state {
 		pins = "gpio1";
@@ -1049,3 +1060,9 @@ &usb_1_hsphy {
 
 	status = "okay";
 };
+
+&wifi {
+	qcom,calibration-variant = "Fairphone_Gen_6";
+
+	status = "okay";
+};

-- 
2.53.0

