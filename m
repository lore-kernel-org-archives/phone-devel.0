Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC4235C197
	for <phone-devel@vger.kernel.org>; Mon, 12 Jan 2026 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226007; cv=none; b=anAeCivQ/7dmFeut9y5uB9T/n79UpKkfEpSOujw9DYsImYkpgQ4HBegEwBh2hqsXWdo4eFctWlwgF0od15Fe09cYnCVszVZrLCaBHOmIh4y/KUE1RWYX9pG44G1SBu2hEchV9dZsBPiBj+51SeTGfbEpAFG+bXGDkrhENJ4ilZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226007; c=relaxed/simple;
	bh=OvJq0jh8QNECDzCdo07ofUb3WVtkm5nfjpkgnAeKfPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdoKOIBNMw4++/V2KX7gGhchs+EHARvSj0107TrOJUq79hOaMTRCnV+ppA5/Xn6Adzsmba8fJYVsxtvh8BRdvUpZzpRIGdt00/dBnButCxzwScwOuBncwLnrIVI7KXHEcCKE80cz0oGHHPhF4rHhuviSV4S7twJRoF0iMPPXvZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dRoqTw0z; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dRoqTw0z"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so12512082a12.0
        for <phone-devel@vger.kernel.org>; Mon, 12 Jan 2026 05:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768226002; x=1768830802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USTvaULg0xk0mT5ybZ9XYBzZEDvEHEKzPaHv4h0K7kk=;
        b=dRoqTw0ztLkVkgFFGVnBOflPk1qssX4ytvO04TY2+LnL5i7zJm08UiKadDtIH6vcoE
         sMKGzvl5KKHpo5TOyTna0JUCLhj5LqXfe0MeIlI/atwtq+ZnABF4C1TMj19hBZYiCu+X
         sJsH39yfudNFg8MuaI+4m3WRBbcERciXnM5cqYQ+Mg+DLBMYWZudg8BMUoInCEjC/D7R
         wEc8bnIQ6r8/+TUT+xiSF6W8YOaZSpvwOK1k0StcnoeUS7113AWYbYKB1fIFH5dGZdt2
         laD8nBzNO0imvZajzQNoRmX6L54W7ysbOkuizybii8ul1cNi65+URUT8FI6c4CSFolt+
         gZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768226002; x=1768830802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=USTvaULg0xk0mT5ybZ9XYBzZEDvEHEKzPaHv4h0K7kk=;
        b=dNaMJHgkq9/aYvT1uiETPhXd0c7QO+677QWpYHaPyBcd/ehlZ7NbNIoJVGcd2y2Xcu
         2493DndsLwraCdVTaJlvDqeRtZPA818MKKT/M8/XLS38CF51ChbmIGoBHaKnOPmH/hA4
         RTuJkeprPrOtRIAqsBk0KVmNN7MAuUsD/VXYI+uctS7Oa7U622uum7wcIqn74urzZCK0
         rFMmzpPnxGkgFDE0rHw9MJgwQ8mni3ySehmv3aP92YIceJdh7bZRkA95Zo3sV+zTd3Un
         sga6XnuhTd7vIAAt6eXTqXsd2z7rFlfFbsLgnfoChZ5GelMqWMuyUcs7a7vH7acOGXsE
         UZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbZXmNbTqC560OQQFZ4h6p2R59vfwRKO5TyRDp4NaClZuKXft7tT/1r/ePnYPpGj5vwBYCi35An00EAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUoOI9Ff78LzUqOYcB3mkYIiMKnPXWtq4eDiaFSfXKQK7KpEcn
	VG7zmlAMTyZYyI0W7BfVX6/6TG7I9OGkDEUjhGh/vrSLrjhfX1d6D9tj4aaGo7OxmRU=
X-Gm-Gg: AY/fxX6OPuECaIbPbtA8buV00dPoqoqD87meX2EIoqMO6y4IFuXNoS44biOYHXLrAq5
	Ihj6dkHyjLusl1/pw0bTsTIvFowN572eFGfAADHLa4yVli9eM/hiZARyPmMTH5FnjW1Utdy4BOc
	0zBqW14J49KZcwVZ4JVpscA9uQtwWBQeOv+sgdCwok+XVJFzlyn7zm2YLOqA2Rvofiy6+M9PJVn
	IQrbDNu1fPgea266v6NXhR7PKIPrmdHJE9J5bvUfA1eBwGwoFK4/Sowaw/XEsW8ijubwFY4Wqdx
	ldniu2aMB+lq3DJnaI5WhHGIwmsihm0ycsPYKE/yNCBHo4GidHIhqxbDZS5LWyEXv1Ccxgzuy3J
	LwHV+HNmYRW0XyS8jAS7q3qUf/OkjGOxPt8ViS654dOmq/LScr7SIB/woWY0Y33/GO+m2RpOmnK
	EdrIJugCEH0rnNcIb6msvXMyHTbq7uyTcSZRsyJ47wkJaJt2PR1Q/sJMXycrwQHArG
X-Google-Smtp-Source: AGHT+IERD9EpUubMa1qZHm1+gsFCHsZnNFyO5sx0pGx/fBWFcfFup5iRk+rNWU7XlYPQpnodXuWztw==
X-Received: by 2002:a17:907:9558:b0:b86:f271:10bb with SMTP id a640c23a62f3a-b86f27111bamr560121466b.24.1768226001819;
        Mon, 12 Jan 2026 05:53:21 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8731f071e4sm25700466b.66.2026.01.12.05.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:53:21 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 12 Jan 2026 14:53:19 +0100
Subject: [PATCH v2 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable UFS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-milos-ufs-v2-6-d3ce4f61f030@fairphone.com>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
In-Reply-To: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768225995; l=1099;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OvJq0jh8QNECDzCdo07ofUb3WVtkm5nfjpkgnAeKfPk=;
 b=h/ju29PagtFfLFrekGbhm7LODk9tgPEQl/Ctp4NfxS8Qk+oz/YilSiZT3fMKpfbZpJ1DfRfuu
 TVU2gzKQrxxA4UPFmjkDU2pdcL4AWg42PCx6hrSqUY/YFTTkQ4ybOPp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure and enable the nodes for UFS, so that we can access the
internal storage.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 3a7f2f2b3a59..7629ceddde2a 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -819,6 +819,24 @@ &uart5 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 167 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l12b>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l5f>;
+	vccq-max-microamp = <750000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l2b>;
+	vdda-pll-supply = <&vreg_l4b>;
+
+	status = "okay";
+};
+
 &usb_1 {
 	dr_mode = "otg";
 

-- 
2.52.0

