Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923D12DECA6
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842887; cv=none; b=JYdPPVsHpXhT0QEpDpkuMHI3xAABwd91NnvxV/SVV2GXgQDhTLKc4QegNc97+mWBIHMSnCWu2pj4IwPOK8HNzFyovZ2TcPnPRXe04H3hpCfqisnHgqjixdgvJEyY/AcUeEMgbL+rwEHg0cpvI90P8OLHbP1zDUlNVdyCLJNERVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842887; c=relaxed/simple;
	bh=+GSUprlWx6WJefoJvkEn+TwLdVvC5fox0gg5Y+LwfHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pPZDMsEWHJlbbeYvHhJuSdAQHrjAAgfw0RHB+hc7+kiescdEBHROW850UlekdBSnlewdGbnFNPdIzns74Z9zLytgT+W+zj8geelj3At0JIzoiDN5UV5UZloPG+86kiedyHHIHAAK5kSwfgyAEPnb678zE48XzZGR7FuMjbGStNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YnwXMN7d; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YnwXMN7d"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so9538488a12.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842883; x=1751447683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ezrrvemh3BSb8JW/T0pKm8QnZFPlbno9UW9Wh0XmVYM=;
        b=YnwXMN7d5HK1HMLjK4Z5acbA1qZ8PKRrwaLBPco/GAg+h/LmH59RUwm3ZBGOHJxC3I
         1txu43uesvpQUNlzv/AFqEMvMs3ttyV+Zc02K4OH9MeCecIkMz37yS521mciS+bXdZma
         OkmbOYyJFBHuZbeYlIIe9PDap5V6QDDKY7pHieVg4z9Phn2hRFVfW9QRz7UZrJu2kCuj
         o2a+a/sodsoknLG3jD0oaJb9y2VSwWH3NmrmPNS2Yr4SV4T9WkMOqkKSuHCr/S/VBdWQ
         YOq1649euFmhX/ia1MIFs5o/7Ss614HxwNeFeFieRgKogcOrGpkXBK/PdsvJ/aJYw+cg
         SIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842883; x=1751447683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ezrrvemh3BSb8JW/T0pKm8QnZFPlbno9UW9Wh0XmVYM=;
        b=uqVLcdCrQIbeGVIST6oJuQ69OtEIoKX4LbDu+EFYHJmwSTDlluK6MPfSehRJO0zMN1
         PIBefj3gvoCX/O3UkSB+JzCZC32YF2L3BSMJo+HIEF0kwyfPmF2RXtKhLLU1GMlKnzEj
         QkIQvaNDKpF5eS0HX6ezMPT8LhBfOyLpOhUO8NNEJ2xI2KOFnt2mNCDh3xveebMRoiDK
         RxpuojW+ZDO3CKLSN6cdTwMjksWQLBei9LrQLBW7Pv+pgUS4POeV3s1Md7LSh/TsosDl
         QBlmPw8ZrFAF1eRrn7eDWN3ru6R4WffhUv2UX25VTy6tijN193/Ht/YgftC2r1umZ/5q
         IOMw==
X-Forwarded-Encrypted: i=1; AJvYcCV1I5dIYCktFhw221eHi4xB08meND1Mc/8gRSiZ59d5U9PnOJwChAXQ7T8I7Uq7jLwiJmDZDSKlZRk5zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8aG3mADc9KcqzjGHgyDRdeZP+ydS0AA9mzYpLoOENHMLcftk4
	q+x1O34MuHE5+XSw3UDQt2sg8mcnNPgePK5SUUKuMkasqSo6yZi+YtfaaK1yIVAyJPg=
X-Gm-Gg: ASbGnctyAM/gj8EUREOPijm7Zh7hjXGwcKs/fajEv6b1UOqhOR3wKJA8OEmEONfqxnb
	6Q6D+16+sfFKT6hT01G2ThUKH+Gc2oVfSprXBaeOOaGebXoZKKV01we8kJYYukwDIkDdirspCOu
	7DOrnSzqP3ADlimektkYCS7jz3wHTprstenZX9LvlH8cYGwAI4pllHcOsxoPPh1aNgnbHHf7Axt
	BH+bJ03Nw2AyJpm+zm7C+U9DDmDgvedTbgn+x8hF723NoFIoGUTNFR/R/jF2W8YnhKQtELHgE6a
	/DNBBwbCS3Wsp1OomRQRsQuWl0I2tBUp1F2iXNW38HHNtPC4/G6jzw1jSpu4QgjfC8V/AQtNRV3
	YeKNiAu/A1EukVtRRnPnnZ4sN9VbGicqs
X-Google-Smtp-Source: AGHT+IGIywmz9c5XNOpnohiRqMmd+RNf51s0QULoylL6obp0kqvk2eHNYG2CNGxRWX+GPIx78Dn6iw==
X-Received: by 2002:a17:907:3e0e:b0:ae0:c7b4:b797 with SMTP id a640c23a62f3a-ae0c7b4b8e3mr100658766b.45.1750842882736;
        Wed, 25 Jun 2025 02:14:42 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083c95sm1021480166b.91.2025.06.25.02.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:14:42 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:32 +0200
Subject: [PATCH 4/4] phy: qcom: phy-qcom-snps-eusb2: Add extra register
 write for SM7635
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-phy-v1-4-94d76e0667c1@fairphone.com>
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842877; l=1373;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+GSUprlWx6WJefoJvkEn+TwLdVvC5fox0gg5Y+LwfHw=;
 b=8aIZ42DeUTJeCukpZfv88iXrxjGwzYcqNfO5sNCK9ORjM8K3L17YRcY5g2wj29GmvQjrgUBYa
 BV2F3Lnv+80BG6IJxhPKu4aj13he04SrDoqxPjnggGeb9t40K8Jf55v
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As per the downstream devicetree for SM7635, add a register write for
QCOM_USB_PHY_CFG_CTRL_1 as per the "eUSB2 HPG version 1.0.2 update".

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
The downstream driver supports an arbitrary extra init sequence via
qcom,param-override-seq.

volcano-usb.dtsi has the following which is implemented in this patch:

    /* eUSB2 HPG version 1.0.2 update */
    qcom,param-override-seq =
            <0x00 0x58>;
---
 drivers/phy/phy-snps-eusb2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index e232b8b4d29100b8fee9e913e2124788af09f2aa..6122fc797c7fd3011936edc3ff4dafe6a58e6583 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -420,6 +420,12 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 	/* set default parameters */
 	qcom_eusb2_default_parameters(phy);
 
+	if (of_device_is_compatible(p->dev.of_node, "qcom,sm7635-snps-eusb2-phy")) {
+		/* eUSB2 HPG version 1.0.2 update */
+		writel_relaxed(0x0, phy->base + QCOM_USB_PHY_CFG_CTRL_1);
+		readl_relaxed(phy->base + QCOM_USB_PHY_CFG_CTRL_1);
+	}
+
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
 				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
 				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);

-- 
2.50.0

