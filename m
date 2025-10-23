Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6928730E832
	for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219478; cv=none; b=pSbOVncXZCJeXuCczsXbbb7plVHlXD6lbiFDfGkJfsPm7NfUNfm8ShryxmMrJTr4nuluMnirUEN2G2aqurX5Lx2ZapAWCwlqk/3uy0Xfi1PpnbghjPsN/IceX46aSJJi/kQ9AdNKLAOL8LWiHZF9aqInZJF9OP4AyqHED91LLMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219478; c=relaxed/simple;
	bh=GJgR0piJewspDPvTjgPSZy1PlRFXkZDs+X+4UGYsrvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fG7HCECNiJlDVeWWmmWnpx/fUHqkPP0gphc8HJsUi4ezBND+ht7DkYrVDMvX0FJ7/Z6XTIKLC40uzu2G2Y6VbVlJr+3MIDcM8ZRf8+ODU5yvXK6h0R1mTYu/3MDt02x0/H8b+Cr9NctV3m9P2YWqDEf7EyfYY3uTezRAxhf0Y5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NExAtWFr; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NExAtWFr"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-63c09ff13aeso1201556a12.0
        for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 04:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219475; x=1761824275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZG8pDAyRGU4j+CYjezXb+fmm/GWjAFggZfHcmsgAGk=;
        b=NExAtWFrMAX8VvYr6RC5bFs6/oZSbvo6U0hzm0KTF6kvLYF1lPA3fGp64DotLJkJ9I
         v+b5T8yJr6hZ7ohxiJtDOO73LcciB3BOkwFmBlw9rAHSFx25GBUvNJBfSkUrP2RxBN+3
         Lu9x6uUq8BafoTH/xnfOPV6c/2vfeDwRqbWDeZ/OlXZoZqxxVlrUoQjTj6c8hcUPEeqy
         KWqUZkoSqa6kVMiVT88jOiVqvAQbf2AEL6mdrP35XPevF6Ej1c4l8f1zysPjGxzSd0y7
         TfpFYUHMCuyljF8QkF6bVfF82+FxGs51TqjhnSiKm80C7P5vaho+MtGHGyaIt4xm+yxG
         5rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219475; x=1761824275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZG8pDAyRGU4j+CYjezXb+fmm/GWjAFggZfHcmsgAGk=;
        b=EsSXl1n437hxzpulKEmPUOWAa651EnRmCnL8HU/FlzYbPpjqKft7Ah0Z8tw5ig3wPK
         8lPwRY9amPv3R5ITb5EMbx1bxGKmoKOSwUq9ObM5khhQAQsBn4Np9wiSKTjXII46cHko
         xCFVl2LYcv4a8Uh14ze5jZ3IWkTXi7utK9DFA9KX5Lxp3gYtvwJMmlh+Krks7W1oGWPE
         rheVUT7VjYY1FXP0UN++m4e3Z/bpH6zSu7xqkxkDNQO10agOTivaGWPUU9S6WgdDOAip
         Z/4ZzNBEg7jpGQHwI+EKsPoPeVYxzCmeOtDso8LRSOSWVcwIyOuiYqA8K+GGu8hvyeei
         XNdg==
X-Forwarded-Encrypted: i=1; AJvYcCWXSqrV+kNq9wIi+t1alNnh23LY4j/Q2SaQuHe6vFkvmuzompx2K2Poo3wBrij4J+at4i6HWzkulbZ9kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynck0mLeUrgeKihnboLspEdUcTgto6FHNeFyM0ExzQN69SeyJX
	IBDSjBWrMvgDA44tsk9UBX08Sx70sIm3kx3J1qgto7yS1S7dm9o4Z26oW2cO5W9SweZkvZV/Ajo
	uswUFb0GSeA==
X-Gm-Gg: ASbGncvIA7L3QAL8MVwDQzo3YA8kza8XDDJZsGJ4eVAX8q/pUS/eSBuNcDdE6So+FhZ
	nx2Sc/FcZrcB+8nbUFM0R6fAuu40+5CS867d8704mHcvgSXHeaDH9MhBlzrrSfFqsdxMjCmwvDP
	QvK/d0F5aWnTwx9+y0SJdvI6G6ERIvVqawFIjNaOei0WRxynvp2Eis9lJcGI8SHuZiwfAXoOB8b
	K8VsuW6mIEvOwU/BNTmoN/V8cefsDrz26cjEikgNe8q9NCH1RcZfMH2XGl+asc2q02WWTNuIRkV
	VX/207ev5npshWl3csgKRQGc3G74gYMyxj3OxHuY1jYEktFkPrfH0/2AJDu9+R8gI5wxJcZuuBR
	3Vvu/1G5rm9+lzFo/gPmVzy72soiMqjuHBY0Ni95592FAOAmpCnDRBjO12xQ07SpIyf7sePnvIv
	+zTUBKZ35yA8aAXJDsnJRpwpwhQdMk6iVHYtEC8k+UoIk6Og==
X-Google-Smtp-Source: AGHT+IGgEGXohmOqHS9yGuQlCdd8uGwSygJIKko98Cg7yAhq0Px2UU4LFUF4u16ehnOrRNdCND3Ckw==
X-Received: by 2002:a17:907:3e21:b0:b3e:c7d5:4cc2 with SMTP id a640c23a62f3a-b647494100fmr2970425866b.38.1761219474748;
        Thu, 23 Oct 2025 04:37:54 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm194429666b.29.2025.10.23.04.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:37:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:37:28 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm6350: Add interconnect support
 to UFS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm6350-ufs-things-v2-3-799d59178713@fairphone.com>
References: <20251023-sm6350-ufs-things-v2-0-799d59178713@fairphone.com>
In-Reply-To: <20251023-sm6350-ufs-things-v2-0-799d59178713@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219468; l=915;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=GJgR0piJewspDPvTjgPSZy1PlRFXkZDs+X+4UGYsrvk=;
 b=Sb0k448v9TsxGsSuOooenXHa5OGDK73tnPnG+dkbLyEQRJVGxxhHhLFd5mNEMwlJuKhDpqLjZ
 QKLiP3a21LMBP2DaNmmelxIZgs6pamR25iKz8EwpqEFJ5ZCwIJkVne3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Define the two NoC paths used by UFS: ufs-ddr and cpu-ufs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 30e77eca4c02..01977d692755 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1178,6 +1178,13 @@ ufs_mem_hc: ufshc@1d84000 {
 
 			operating-points-v2 = <&ufs_opp_table>;
 
+			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "ufs-ddr",
+					     "cpu-ufs";
+
 			status = "disabled";
 
 			ufs_opp_table: opp-table {

-- 
2.51.1

