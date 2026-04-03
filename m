Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8B040DFBE
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217855; cv=none; b=KBw+Jfk48yI8QiNADZvFpipI3ew5jdbT8+tmhlQKnU53P47a9i0DgCn4cGlrX39AlIlkv91Ewn4tUMKlsBb3vjaViLuGM5ninwboCeGaVTZ1/nQVdli8Hz/GYqQ8XbhL4nrO7HPH/xeqkS2DbNLw1filSy8AMP1NWwyP6cvbarw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217855; c=relaxed/simple;
	bh=y0Ba2DL0Mm1AYioDzm+l6IeVu5Qc3RCVFN+Tk1snlKg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SWNrVfJCaLQuEpU7eU/0wqHzt3DtFdePniCPcV5Sqhfzw/gYDO2FRYRMVeoZmpvwivP9w1tExIFKznhqY/eLxWPHBL/5LYqdqw3M6uSwmY60xtkLAdA33xnp3ZZIMJ5RdoPrBN+hg6u8gvI3clBpdME0JPCJ7mmiBRuNJ3wNIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uYWO3uu9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uYWO3uu9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso14909885e9.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775217852; x=1775822652; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ll+iZV9FtI82+3K2qodQMK9DQkidaSv7WLnG7gA2vsw=;
        b=uYWO3uu99fVf/MquaAni0L3966Fsu9UK2im6FODXPuNaNy1VDapOA2PKud+4wQAn+9
         HhKxPmyD1r7soVnD988dUHHytQqB39Z+fy+qgtgxir1wmwH2diXjxzQ5pn4TVS12GflO
         jiekTfdp5xLMfeO9B6aM899hQXTymRkE0RIjzQh+L4mHE74IxGmB2PnQPG98hkY+pVY/
         xDbKfedF5OpxKpwrZ2hkULORFl+rTwtZnKh7dc8aFU+NnlY3olmPKBqhLeVhlmwkT8L+
         V4C8LXpuGHQ3DYT/5SfPOsqmpC4XYQX/DvBCngSw71BQ7ANec7zdL/7eKKknHpKFjY56
         DT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217852; x=1775822652;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll+iZV9FtI82+3K2qodQMK9DQkidaSv7WLnG7gA2vsw=;
        b=bsMDrk9yNjlSI6o3MUll8nx70f4cmgfoSWozmnBI8YnZj4eBeT6KH/aXjpfMXoAlOU
         FBth6cMF6eFK9G0yqyKRJZ3o5htBRF8qVDuW8Zu88T2QUyDQxqAvB9WrGfW1b6+q1K7A
         XBM/nwJPjiT3TAHTAjVJtJbQtxFqqp2mQkNX6IYd/ue/jb7uLZr/Zop8txgz+VDqi6+I
         RhZbkReW1DdvLuNSdWD7Z4QdzX/OU7bnmWlwYRV6KMZta7T66ko566kqEBG+KVsh3Wkg
         l/t4ID5PQdTwVYO0QXFju886k0sWiI2KHMf0qTUcuBSCMxmTxxnKS/Bm1GBEw1iAXG3R
         v0gw==
X-Forwarded-Encrypted: i=1; AJvYcCVSp25EdVDcMl5eG28a4jPX4gBGE29pcQW0N/uphk6NMiiYyV52Hv1yVtVaH8onZA25Q/985BfyK71HpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvnip/7BB8BaNpBw9h3kAl0XHjkwUwP8V4rk1tTP9comZDBeP7
	mbeSkF1Bn4FTEP0XPf70hXTTDOoFWeNrZCwIk6LyBp1Q4mvzg8y/J5UCX9DeESqP+ms=
X-Gm-Gg: ATEYQzwL2nhSZbsh4TfAg/9mcfq1G4oTK+XCKXgfc/VR0/BlNLV5/CO8cp/oXEy5JUN
	0nkuEkere8+jcHtNSxEEwmzm0bcU6h7wPzaQl5kKz1+ZYVjJ5Y3kbufH8nCxgP7MMeNdqndornt
	vpukxW03DgMTDC/FG1PqesOpA15kCfIdPXn3I+kQxaqiOicQ7iphIiTEZ6QYTLNIF5uIuBuMZV8
	xRMKnYgfmymOYnGXIBodd8jtzDFKEPVZJTddZojTXeGRwOEt5YV/Ig4hFoSAYJnhkhpFcEQCJMv
	cboVeY1oWTxS8DGFrpj/eEKrsLc8NCUqC0pv1ApN8KqTMrxyldKGPjKBPr8FQ+ZjquR/gWMaMND
	2Df+PEa6YOGSgUNqvfOQ8XLhYlT/Umr3pTHjGefSV1kG1TGobbjKKfpDdC+AyEzmmrlzGtcTs4G
	A9qMBNXbIaAOF26Gdq0vVOqQ/jhYO3/TznvA==
X-Received: by 2002:a05:600c:4356:b0:488:9ed3:148f with SMTP id 5b1f17b1804b1-4889ed32786mr12200445e9.21.1775217852087;
        Fri, 03 Apr 2026 05:04:12 -0700 (PDT)
Received: from [10.157.142.139] ([41.66.99.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm300193995e9.0.2026.04.03.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:04:11 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Add support for GXCLK for Milos
Date: Fri, 03 Apr 2026 14:03:45 +0200
Message-Id: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6CMBBFr0Jmbc1QFJCV9zAsCgwwEVpsK8EQ7
 m6Ftcs3yXt/VnBkmRwU0QqWZnZsdAB5iqDule5IcBMYJMoUE0zFyINxolvq4Vn7QeQqTzLZpCo
 mhCBNllpe9uCjPNjS6x26/jhCpRyJ2owj+yLStHixty8o4Sf07Lyxn/2hOd6Nf9tzLFAgVngji
 q83ld1bxXbqjaZzGIBy27YvwgCf4OEAAAA=
X-Change-ID: 20260306-milos-gxclkctl-8a8372d6a1e0
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217850; l=1101;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=y0Ba2DL0Mm1AYioDzm+l6IeVu5Qc3RCVFN+Tk1snlKg=;
 b=kLWENhEQXSsTrvRcJkXn8V9hEnXhS0ktYUIqgUKUN81tHFzclgf1ExciJnbmk08N1g06dNZT6
 DUdTWbDeOIxACcU2zbtkdSv3gUyn88rIHQgbzO9tjkFv/XIr/B8bCzL
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Similar to other new SoCs, Milos also contains the GXCLKCTL block that
we need to control for GPU. Add support for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Update casing of binding title, reg goes as second property (Krzysztof)
- Rebase on linux-next
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com

---
Luca Weiss (3):
      dt-bindings: clock: qcom: document the Milos GX clock controller
      clk: qcom: Add support for GXCLK for Milos
      arm64: dts: qcom: milos: Add GX clock controller

 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 10 ++++
 drivers/clk/qcom/Makefile                          |  2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c              |  1 +
 4 files changed, 73 insertions(+), 1 deletion(-)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260306-milos-gxclkctl-8a8372d6a1e0

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

