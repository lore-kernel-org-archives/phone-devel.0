Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF6942188D
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 18:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462071; cv=none; b=lPjxJwLo8lfIo+60/MCQVGlRZhVdizLDe0RFTlYzismsYF1QCXWQgtyF4DRVlWYNavtdhAW3YPio7Gjcsm2jgL31MZ3vGeug2E7LkzmJIKk8qHYov335Cv+UA++pkRppwcG9vbk8Lq63eKdzXCTa/A4RRK2rNB8skjq/oxqokoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462071; c=relaxed/simple;
	bh=SAlCTNhoYBl7jxXpQV6GKIoXoc+5g1uH+ayRwKvoDH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejq0GsBF6rTNrzJMTqqzhPIiXyU8L9EGoZLOY1d8SIvapobu9NRxZ9N+hgeWeduEezltv0jTatnMQLRBCX7JWaStExYKMJYurXyfKzaOpItIMXnzRlkAsm67FK6CztPS+E5I/Lboa6sD96dzvCAtRj39tSFzZzwZPhJknRm37HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOMagz4o; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOMagz4o"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c736261ee8dso81583a12.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 11:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462068; x=1775066868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5py/0HOJBBmCXHr1qpaeBygvrnYQyzbcn8bu1Z3hzw=;
        b=rOMagz4oBevcgtyRlh2BLQU9nLyBqB+b3FYpJCtu/OxZA5eoP5o83IOR7Hi6P4I/KY
         974wvTViL4Rg97e+cfoULQzjTXzwIW8K2/aAMVmP5OUkEDHiTV9s0TPzeeirtq4rFK/k
         RjWufBFI4sFctN4Uc4eeK40hZyzugKVciikaOsphOxCdbe9N9GesopKUSixzG7NnGclZ
         yhDjHdRgYhUoK6gxXyhyY4MIBkDmEPfo+zdr48yTj8n2uOViCxn4SZ5FozChnzfOnfrT
         st9pa6wmdAXAdgwexkQAHjY2Op8+98M5pLz19UtT1oLroySUpX30DiZvkK7Lq1Hwnszj
         u/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462068; x=1775066868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5py/0HOJBBmCXHr1qpaeBygvrnYQyzbcn8bu1Z3hzw=;
        b=q+YEM85cpCjhWy/VJJocTnGf8mBA6wPDEJ1haEvDx1LMqNJ/VtPsC6B+fAHLaV6PKj
         itlcfN1MAa7ids1z/E1Un1zFu26uOKpN1me4yqmJnbtqLAIEF6fzqkrix3Q2Drg/AQaV
         GpaclHzXaCDxiqusJJZkNDr1Zotu9hNsxuoxLTMG2u1IO1/gWhzJ3XdiRUZSyJVPsfP9
         CDmL6qpWWZN3u0vYtZtTYdvpZQhv/RFPkmA+D2GkUOH8TF9D1uDH9Mptvfrm8qdrOW1H
         JxMM9KkYxEVPPX5TeQCIU9zDELQw0kkd1jYc2I8l2vrZPby7qkzn8OiTMkUY/avn7V6f
         l0pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBWwuqGGKieaoROoNhoIrXh3KVFAhuc9w+3mYBovLiBuw8tXlwDAiRJLLsqU77SoqohpuyWdUSNV0O9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVG/9S09yzeheru3haNMTxJS+aiv5itsyj9LZUBQNLGzrAWn6o
	P5wqCugZWx3AQ5ojCiFFBOIFxyzXVlvBqrO0bvsbAeozG6sQ/ZwwZNia
X-Gm-Gg: ATEYQzx33kOi2TPxdqQznI59fALH+zCRQJyT60a2sEOnInMP60zFELaX4LUFMR8f1u0
	WMFlSBysQYcDW824p2gbPxpZvEsFZzLF8BJinS7i6JQkLWr7S2qdcyLzmcuNpAkcLOpyuWbuS+S
	kEhRTsvb2Ig3hiDCoy4S2GQzIAw7v1MbapEXRa/R6k0jK/1tHZjpBF1Rz22QiWSADXJyBqoyuwm
	cvpR5JIeqdosbIBmptz4O8DtBisSAPK1jYdZT3d9+7CLXz57A4thcBmSeLW7neCJBl8O8zYRRhV
	5xBcwS/akZBSJgkurwtr5vuf5CSer02vgPG1BxjypyqrbvN0fxT+nCY3FEubKJtIA1y2Q22atiU
	2DZGNXKo9ar1R5b+FH908RxvZkL5i+Qy4K7/BmBZHOZyjq1vBwnKUBoj1CqRr0pw1iSSeySM3yC
	XsXRbS5HyUc+uCDTS5k8Fs2aw4CBPB
X-Received: by 2002:a17:902:e784:b0:2b0:4eeb:f80a with SMTP id d9443c01a7336-2b0b0ab3a21mr50563235ad.29.1774462067634;
        Wed, 25 Mar 2026 11:07:47 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:47 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:25 +0000
Subject: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=919;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=SAlCTNhoYBl7jxXpQV6GKIoXoc+5g1uH+ayRwKvoDH8=;
 b=voXfhb5tQm3cVPDqWZP3DiFroa+n9Pp3IhcNpBymaT+ppwL0cOEgPXmQqxc7neKiDp8CqQHRt
 92SQS4v/upQCCItffWGtN3Vw5UcrLztgcL44oBIFh2osoEjUhpL22gp
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

Plug in USB-C related bits and pieces to enable USB role switching.
Also, remove dr_mode to enable OTG capability.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index c84911a98fc..259a24fe24a 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1238,7 +1238,20 @@ usb3_dwc3: usb@4e00000 {
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
 				maximum-speed = "high-speed";
-				dr_mode = "peripheral";
+
+				usb-role-switch;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_dwc3_hs: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.53.0

