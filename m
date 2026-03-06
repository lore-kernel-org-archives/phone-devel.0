Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6B438F222
	for <phone-devel@vger.kernel.org>; Fri,  6 Mar 2026 14:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805694; cv=none; b=WW1SINXvEPoMcOWGR/x4rp19OWfoLRI+wsPN+8Bva0Ht/07bykh5UOLERIGDbbgQJYp3ZpW+13XlFtg3BzgugcnoULBaHLIXn6FDCISEFCMIgsErZ3W7ubcse2lFPTG4TYHpy7Tik27RhvLO3eqs9dfGl9mMIjJE+d7vkautYUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805694; c=relaxed/simple;
	bh=L9aCmYrVlZ4PW14Fpycu7TkZyCpdzFqIVjaZtEOLg0Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qo0O+Kyai3m/pE1UKGomhVD/mRsDN6CmpedB/HOp07t1uhAMky3peT2pkdw6U+ZiMFLQ+Zx2mBWa2PQPCuznOrnePkFujX7pruULlsE0+QPyiKwlTzwRAaXcMU4aMbgQPCoLfwZ//u8S6FWn0vvJbFiboBoRFEJu8Z+kDu6mX/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=XXfkMDTo; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="XXfkMDTo"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b2965d4bso5105818f8f.2
        for <phone-devel@vger.kernel.org>; Fri, 06 Mar 2026 06:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772805683; x=1773410483; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7aIxKNveDFp0/XpNnbeBWkYfukXfTraa/qjTjTHoatw=;
        b=XXfkMDToN5jpCwjtg9RaFd/y5mKKzSXvLQ14rTUZFs6HXHbOdjIH24EFS1BuRohESq
         WG52TdPiT+md98ouRggGTlaZhI+a2WRApJR0+PVLP23nHHA0IzwBaUYl8F9GeLHc6HLw
         wpmiRX3Pob8IqF2p8+/1yAReYR+zTCOFsahnmGUSkjv9nh1e829s7foD0OcK/g+tNagr
         8TmNyfKks44dlAWsJqt3R3G0pb8PT46eGJX99J1a1wfC28XLo44Ium7ZjcOR41xXpe/O
         vPv6vemLrE3FTyyHNPsla8YAFT61DXEl5LyJnJo0HFjMqqlxtq/34jgJT9SZLteVghqy
         eGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805683; x=1773410483;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aIxKNveDFp0/XpNnbeBWkYfukXfTraa/qjTjTHoatw=;
        b=v8OgzsdRTNKJj+VrjEq0Xj6W2b/BWJmEaxLGQ0H4KiBryojEzrwdKTy7wuzTuWLNLI
         +ycxmOfovzy2rOT8L6+O697oGWjTrhXxwMBLOsjroKZKWPXQb+amlsE7/jR1umNF6RaS
         ZzvuyekHnbRZOMSrIhgLi4osWwdTNLqMRaX8sN4BWAAhMAh5qBLaMFGzmnGa1BWevLKV
         3TdtCDjjmh+SJE0ooaD/BbcubvFx+zEG1o9hzdB6AIQYvLIiLpNcMnPo1hTUfoq2orIo
         fLnlWzZmf/uelxqt2lQLpkka1jwXXEkpknzQTIhm+TibiUrdIYUSylvMpaS8cUsaUWgr
         H4Xg==
X-Forwarded-Encrypted: i=1; AJvYcCX+c3xsskj7PVf18P/sN1mVfDnUed4Q3CdPMdK88WQd1heOdTBV6RTIfH/y7kCdlrJ57h5r8COOSNnRuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVMWe+EV7nejoaXI4eh9eEnXREgCXISlKnJlvD1efabX+/eOr9
	iBxR76SuFPVPJEOkkggOXW70YZS0n5X2TzCluwC0xSXHD0cEi4tZxpwRGu8SMet77HlKOgaArlU
	e1/Kk
X-Gm-Gg: ATEYQzzydH2nb5zeMcGnX3yd63xZ/ryb1645lJ9eqXQMlAkOTZV8aNWNO9P+4TPr2fu
	Kwj5uU7KFMZ0wJjRQ0Dg/p6cCKU73nTjUYJ8dACagcvvo9iszePFA5vb+I4ZbQorkRsE3AwKLin
	r4bRoC1OtEN/WGADaiWXUlKSmgXKtF5CNVCPWbP6dTUXJkIXZ/MQyK8PDJCRBke2VmNKgBUi438
	SmchoBohvOdxb4V8SULbtvuPZKsNpiOa1HnaY/V0Yy1hH20Ny8GYNs/Sf+Vd4AZU1zYUhFqdR7h
	UQ30mAeAqO6otkC8TU80amDu1YQE7eE9Sj8/Xn/uxbcXyfuYR23kYmF6mytyP8D7U1knmGihuq2
	4AKp3I3eChVG28BcjWGDtflTti5inRHOZ4cwo0i4gv2EAF+7ksCBw8pvTffYwJNGEhPWAMtyA2s
	bSObWj3D5Usw1MOEjKpRQyJDuQeSMmWNNPfqtxjns08mM18gbbay6YE2iKRtBxGpY6IkSsGHJ2E
	jFcixdEA+dVz6Y=
X-Received: by 2002:a05:600c:4591:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-48526978644mr32267695e9.30.1772805683313;
        Fri, 06 Mar 2026 06:01:23 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97be5sm4313828f8f.11.2026.03.06.06.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:01:22 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add fastrpc and GPR support for Milos
Date: Fri, 06 Mar 2026 15:01:18 +0100
Message-Id: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MywrCMBCF4VcJs3YgjSFKX0W6SOK0DpiLSZRC6
 bsbrMv/wPk2qFSYKoxig0Ifrpxij+EkwD9sXAj53huUVEaepcHAz1RxtrWV7HHJBaXSRrtBuau
 6QP/lQjOvP/M2HV3o9e50O0ZwthL6FAK3UURaG/55DdO+fwHpuRChlAAAAA==
X-Change-ID: 20260306-milos-fastrpc-gpr-02464b12b827
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772805682; l=541;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=L9aCmYrVlZ4PW14Fpycu7TkZyCpdzFqIVjaZtEOLg0Q=;
 b=SSOmp+Tog5dudIQ0pSdCXra7o4zTEE+d90tyJjtmDN0HTdrwao2coy0F1zq8lc1P9ZY++IBzr
 1M0df5Rl3yRB0AN2W8Doa6oksTFEVX9hHrUYyKLJBMUCmGCtlJn7txY
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add devicetree nodes for fastrpc (ADSP & CDSP) and GPR for the Milos
SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: milos: Add fastrpc nodes
      arm64: dts: qcom: milos: add ADSP GPR

 arch/arm64/boot/dts/qcom/milos.dtsi | 185 ++++++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)
---
base-commit: 755bfcf32666f86ca2a9a2ea2c9dc7eca4c330a1
change-id: 20260306-milos-fastrpc-gpr-02464b12b827

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

