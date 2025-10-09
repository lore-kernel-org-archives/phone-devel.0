Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA96B2D3A70
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000813; cv=none; b=YTKeU8erEGzC63YAZ666nLutCKCee6X97hTgKJlrUTC5dCkX4xr0rwQEGeji5ZWu+UJBUBmuaz5QCmXEio/4jHlh1JPMf66QTOAD9maB/yc0GEcTsoI8nzF4VfaWPYIItCve734pgO8ogf0x9JNfBN0CbWm/JTZ8BTuID+EOrqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000813; c=relaxed/simple;
	bh=KxhWShlkMtnpgvA9wjVU6mG7t9GuRy+dxnd6ohchwik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sekr8SS6kzNMSean7ueWrkiIPgZG8os9fhGUz9/hk5oZLuGYUBSAzzI6ou57BcQumN/NxXPCIUw9ZUrI9AWfTCQmiNj94hfGmBk4dj3bBp3KjIdpJ1lp8YHiGnckttBoKPAeygb3gQBosp2tZBGYeAIFqxbWqb3qA/c1M0OYOb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mHY5HSxo; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mHY5HSxo"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so1420063a12.3
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760000808; x=1760605608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOPGlZMdi9oRl632ND1QurYAdEQ/NjrqBwEHEKFq9ks=;
        b=mHY5HSxoMIr/iJDPAmDaWHY6hlykl1nXb2pepwMYNNCLH/5mbUP1dEvoP5U5E4oCWf
         WP/OAtMPueR6zvZr50kBGNy61e0K7+milgJgoSS3IhYnN0wOPbhXlHnNBVSYaYVUYfmP
         LTKm+jlRlQFGiL+eOp3I++mlOdogI27qCNHgj4bFkt3NHGFbyN3qAsfF7/u09un0CStT
         xeMgpapEtyV9Lc8lNd4s7j+2pSg6ZS2BdLMlUlDBsrYG9t6OlGJJEcQ4RbXoej1J4dCw
         CfFk2aOfXhuEhjnjWNC6WmnOHwOKWmbeqQN/Y65Wv4ucz297gWDVT/Hu62D6LP3Uh6lQ
         uydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000808; x=1760605608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOPGlZMdi9oRl632ND1QurYAdEQ/NjrqBwEHEKFq9ks=;
        b=SkW13fTgz4cboVZNy/uQMT0MOSAiEKQ07TraET+uHxkiKIkqlhY1ROyMuSXgPuhF5D
         H7gFDFih5yA2Nis92eia3W2HxI0LxcO7MOx7zdcLUa9o5b834cRgdywFtWVDJwpxBgS8
         AyhlZyBZd+0o3oIPKrKN5WIZAtRodiPVrfd8ciKe8a6YSuky2E0buTzcpC3nZMVo8XmI
         OlZ16vy9cLOpcbtD5trYRdT/RW+NSza0L6LmJnCYtd1kGaC+9XA0J0nIUktmI53XJydl
         gbow6BFu8vIeXjxk/6p7juHePaAvtiV6Wjig6zUH/K1nxELc6H08GuRm3ROgC+3Qmy3o
         2W+A==
X-Forwarded-Encrypted: i=1; AJvYcCX9wx6SnW5N5E9/WZwsE5bct2d475ki9IqBXvNOwHWtpHB58RiTOhNSwaBXcJwcI0Nz8Mcjnb81tIWzAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5NdSMO2ZiJ0l+q+oycxXvhcH0+4coq3yfni+gi1KkUuLvQW6E
	+mAb6oyEtuQ9tQ0yW+hT2usQHMBGhZ5w5C/WWwhPjqSGYYAvMenwi1BRh2YVqWOOLHxL6s7lUbS
	WogA4UBA=
X-Gm-Gg: ASbGncspLpdsCWOLT9Bgt6F8P/X+zM8aHtEShb6msPpM7npOn6LqSy4CzMiZVGNRAXA
	+ySRjHIvYJne4frXxnBlcEOaqqM1xZMs1caEz4nW5HDn8dviJqvQ3Yb4PyJCJ6ljyOaoqhpl11g
	nxFlaodQbmaGpaKGTfoBvYhXrbt8N9BDM+MyhZrGtyxylK1uFVs8IfAmNG1Ykfrq38DWyUCM5fU
	KmilH+BRX0E6IlCxzLuPlD8l7LwLyJJY3rcM74t7y/hg6g188byMUwYFBlOuAvzDSNGinRK/q/g
	SKUyqUhWDG2gKwG/+cyDaV24Ij9vVF6pTCLSdhsrSCH3maUFnyFBB1N/bJx7PiJrc3ydnPvwr+p
	Z5Cm6jQWh1H2VbGkrmWxJ/fPkT8nYPldrcCJwPdqtXAfaZ00FjGqIuiuz35yiG4ENE4JBUasfXk
	3XIYkI98aCn/KZYaa10Q==
X-Google-Smtp-Source: AGHT+IFHCm/dEaK50EAVOzvdljY5VuiyPEN2smCFmrRrLPkfy8suvXNEKkRcoKJAFNBkFgvYS+lgbw==
X-Received: by 2002:a05:6402:d0e:b0:634:5381:530b with SMTP id 4fb4d7f45d1cf-639d5b8956cmr6102646a12.13.1760000807576;
        Thu, 09 Oct 2025 02:06:47 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f4109046sm1905755a12.44.2025.10.09.02.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:06:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 09 Oct 2025 11:06:33 +0200
Subject: [PATCH v2 3/6] arm64: dts: qcom: qcm6490-shift-otter: Add missing
 reserved-memory
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-otter-further-bringup-v2-3-5bb2f4a02cea@fairphone.com>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
In-Reply-To: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760000803; l=1053;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OCp7Rwq6dXcutSgzEgmD5mLRNx5n5slwM/FWE/OfkjA=;
 b=+5zFyGY2k72voxYJC+mcK4IdqLYco3K+BRC/ZE5ickeG58QeQ3Czn8qg7S+adNv9qW3LhsW5C
 BRUAMAhdeKFCVqPOtfPKebyKMjChhjY2c7/OgilVR875VwiNVkhi27T
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexander Martinz <amartinz@shiftphones.com>

It seems we also need to reserve a region of 81 MiB called "removed_mem"
otherwise we can easily hit memory errors with higher RAM usage.

Fixes: 249666e34c24 ("arm64: dts: qcom: add QCM6490 SHIFTphone 8")
Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 0d331bda4a82..31650c29b1ca 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -118,6 +118,11 @@ cdsp_mem: cdsp@88f00000 {
 			no-map;
 		};
 
+		removed_mem: removed@c0000000 {
+			reg = <0x0 0xc0000000 0x0 0x5100000>;
+			no-map;
+		};
+
 		rmtfs_mem: rmtfs@f8500000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0xf8500000 0x0 0x600000>;

-- 
2.51.0

