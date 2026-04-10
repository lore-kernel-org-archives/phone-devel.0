Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595A52727F3
	for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 07:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806296; cv=none; b=SPJNsw7Wvn07tEWYPG5biuLycLJrOsq8+kXHRme0Bm6xtsJNdVEoiPfIU2mdOuciLC4b5ZTFbiGtdQZyvSFJgPAhWVH5vVMFjEzzGO2tjqDaUj+1lRgpnI3XvaOJOCn5fDpKwrxtvbYKsDZdJdPuz00mJ7Kl03L6JG7AGw5Dq98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806296; c=relaxed/simple;
	bh=3P0tOVUn+JiOZLFR0VZX401X3jxq4V/mMKfAXPPWGw8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DJSzHnNZdJlWbWvaybMOo70qzCl8Pl4LqkDLP5N4GzU29AcNDoDsmab2wxdlMMEWrJ5j4YdDVBE81yTzHuYgZ0lTvUmlSyb7wnRkKmMOBtgmPC7I35B4Gra9+9J3Q8O2bocC1XpD2jEtxdqdQQbRi6U3oTza52sk9f0mJiFWId4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dfSM6Jxs; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dfSM6Jxs"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6708c954b94so569339a12.1
        for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 00:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806294; x=1776411094; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jC6nuTCtenEXxubvMtX2npbfK783JARm8sUf137RZP0=;
        b=dfSM6Jxs9G/Jh22bIT+bzzK9o7QEKnCQoE1XAU7JN8G6WEvTeRQcun3eXwJCyyIXui
         ihxkHtZ+zg6Fe1bJDaa3ADbj7zhKxAF8A5nMM78SrE/5OFlOpkXh830ViXc8oAwujHFU
         Cxff/S2THUPPMPL67R3yHttmxhtJKrkAhRpsf778LnMPKhNbRWWl9I+o+cj7B/3wPqLW
         I3tJ7ghY2xh+OaFCQbBjtZ26Cq9WHrkeVhf5yMInivOnkPanfGNVbeIBQhhewmtpBvX4
         50/zKqIMgAE0qz6afcg4WMjQXPf/5UM8BhiP4TENgIu9i9GvIZXuruJL6avEw3i5gimB
         BrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806294; x=1776411094;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC6nuTCtenEXxubvMtX2npbfK783JARm8sUf137RZP0=;
        b=iN6OytTqL9gcbVBPS4vRI5ON3+dA4M45iHj8+hZnVFXtqhX+1Mk0Osion+Z/TMQAvC
         dy/wzGrTdo/L0K9D75HlLM82QLUo2hKnZj3eH3TkZGvBJZRu0PDN85pB1qe+1fuJVcoQ
         q54fHT9x71avczShgh0mGhP+XUIYf3nmW/eCb3lPq9uSG7VUMGiCcepTWOWShvDU8F1l
         xOYOLJF18gmEFz/coDSxUkv01qd3Kka7FHBQp3/jDIJNKGS+w+lI0Q9EFtP1kPhZ0E4l
         u2UUN4DE2tMLj7fhaML/+pSMu/yi2w8BpMu7JDW2j4dyt3amhb7iLXsi7OSUZ4wB6jF6
         z19Q==
X-Forwarded-Encrypted: i=1; AJvYcCWU94izhTCoFFg78IMbuMDmefAjjD3rrDgZ5AM+gDJfwF1CNQZ2JNHV+JARXo5a6lAZG7ePz95hkA8jlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMup9oP4zCtFH7ixN+bAEBawoax6WF3CtzvSvYz6BDObLzvltk
	4Tdq0kvRa1y22KaVF9JuFGEEigWbvsikhIMLl06shfs09hbsUe+jFWyFlW7cl0gfSA4=
X-Gm-Gg: AeBDiev6HKmrK+h/uhpxSv7suQn4I0LbPAkC0VYye6EZKr8yjCgb3fRnHOr8uYSkelJ
	Lydh4gQdpCq3wQYPKlTSGQmYK1U/4sXHINFd1TyR89xqWVtByCeUkHiV7W+rmToIsli/EG3OLNP
	amqiU7Lh9c4iUdL4vvm7udPFW6VNBLLELWRdWF5b28Fp7nMNtTknD+g3wXDbOT6zCMHMcVC2lOV
	h7K1V4xMZV9I0vCULeMHs2yWOnqHV2RDz0aUHAr3L6y8okD8VDG8/k5HXTY/08bFO3nHBT/PsHf
	xd+fyU+o0k/gEtmfKb3EkNXfxx+oeqogLy2yMIJlWNniKw5VRV9a6K/51vlE43PgyvL4ngx5mem
	bzOm67ThOEvANqSoQhP4srJ6d52pOz8LzcC1LmpUSFEASsgpTBft+choE5Q1uZuLy0Fgt74ps/y
	gb5EAkKNRFTtvdo80NJ6zRcl8eQ3DhbAuVIsSL5C1gwhliWGjV4whT0K+g+/QwOLlf3j5GrqksN
	xkbeA==
X-Received: by 2002:a17:907:1c9c:b0:b98:6926:13a5 with SMTP id a640c23a62f3a-b9d72ad9e26mr128087166b.46.1775806293696;
        Fri, 10 Apr 2026 00:31:33 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670706252f3sm365513a12.18.2026.04.10.00.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:31:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/2] Describe IMEM on Milos
Date: Fri, 10 Apr 2026 09:31:05 +0200
Message-Id: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22QzW7DIBCEX8XiXCoM65/4lPeoqgjjdbxVAReIl
 Sryu5c4PqRVj7Pab2Z2byxiIIysK24s4EKRvMtCvRTMTNqdkdOQNZNC1gKE4pY+feRk0XKlhQI
 p4QC1ZhmYA4503cze3h86XvoPNOnusG8E/LrklPRYY72OyI23llJXOLwmvicd2HOFrtjHLU9+J
 sNj0PY0pJ7cQO4cT5ai4RW2rYKxVkNVdotk9xITxeTD93bgUm6Z/92ylFxwkADY99CIsjmOmsI
 8eYevud5mlR2f8OYXLjNeiRY0HPJThPmLr+v6A2c5bP9sAQAA
X-Change-ID: 20260403-milos-imem-3a034224946a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806292; l=1077;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3P0tOVUn+JiOZLFR0VZX401X3jxq4V/mMKfAXPPWGw8=;
 b=fzWAEBRrgzqqypMJayiqOzYZx/RVQud3fWjTLeg6NEXOhn/H9Z3hdI0cYqt2V3lqMIeXXIvu0
 xXD+Giubpb3BmOKL3dphR8CjUpFBwBpwAfbtZCAeiOY8641sCP5zIHZ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a compatible and describe the IMEM for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Adjust node names to include hyphens (Konrad)
- Use hex for ranges (Krzysztof)
- Pick up tags
- Link to v2: https://patch.msgid.link/20260407-milos-imem-v2-0-5084a490340c@fairphone.com

Changes in v2:
- Use mmio-sram for describing IMEM
- Link to v1: https://patch.msgid.link/20260403-milos-imem-v1-0-4244ebb47017@fairphone.com

---
Luca Weiss (2):
      dt-bindings: sram: Document qcom,milos-imem
      arm64: dts: qcom: milos: Add IMEM node

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/milos.dtsi              | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
---
base-commit: 0190c2c6dae368aeb9bf59a449ebe23f24bfa059
change-id: 20260403-milos-imem-3a034224946a
prerequisite-change-id: 20260408-topic-sram_dtbindings_misc-5e8834f63d51:v2
prerequisite-patch-id: 1052a7a8c6ef7e9ffccd547c934b318f27ce4c26

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

