Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4482637189B
	for <phone-devel@vger.kernel.org>; Fri,  7 Aug 2026 07:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088780; cv=none; b=FqC3iDmRHAMSY9ZaA57NxJKpyL0peXI1fJBfgxnyFoSf7oOMfKk52NhNt10CPKWQDc4TqEi+PUpPnuWaDqADEy30T0MoB3ipXN3MEp+xoEByokTK3YfcKB+UmaoXdI4Or06/6tTdsMCBfAHQTcLvUWedJ4ElPb9Q7WCb2IiUwFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088780; c=relaxed/simple;
	bh=P7zzdIRqdZ6fveRl0JmvPZyWoaqMv4Y5eD53PVa0mv0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rw2cnMtKfcEQFJ23rU5H+80TqHZHXggQp9mgkhMu6zHx1z9DoQnpwStEpsgtWOr3D6aOOph/F6mXq2M/23cj8KFJXDiQ6jCXW0xhQZoEmSdHRpjyIPcN4E34GnXbCubFvqU1yd7TejZ3QqDU+qrf+Ls7ix022wmlkQyWa58usvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DUm5w+GU; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DUm5w+GU"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso3902213a12.3
        for <phone-devel@vger.kernel.org>; Fri, 07 Aug 2026 00:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1786088776; x=1786693576; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R6xAt9GiCE8XMGCgzOdC8zwXDsUZjNyRZcZZyQ6F4b8=;
        b=DUm5w+GUJaJoeKARFXXd41cN9TCCEjmKBb+7pmSjgq7nQatJdyQXL7Nt0YCQcxdhZm
         XAPJdz7rZjTKFvv0OXJfYtZFhHbBQX0auXnTtQx36d0FCnRO7erZRqrD9x0hm1QoFM2W
         y6fm2WACCa8ICbU5WaRQkbP5QL9yyWbkEkIhbcuHbGo/2uNOLCbZcOGZrr9A2xnVrGIk
         N9cBiLLgBPMnsf6k0v2mkuNFndPs1E4Q2neCbucb6eBQN9C/LAW5jXEnjT/ygPPerwTJ
         xJlxDiHWbf6o9KRb5fUmmESfLXHKu1yEDx+UkQC7Psx1ipis+5+esWkwBtyiNWjemuXn
         fiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088776; x=1786693576;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R6xAt9GiCE8XMGCgzOdC8zwXDsUZjNyRZcZZyQ6F4b8=;
        b=hHh0oHI9wDR8YcWPjUhtZ7ul8c4KWbMTLOwebDiznRFhajmr+hD/LsHz9xkowuXkcG
         q9I8P5VhD3q1i/uRcGe5UJiIwZFe3RmFdkpBbNMlosHx1CGk1a7m8gmJLVDzxNawhzms
         Q/d3j50QMyWCZ+66vtOHYb40yszVJ9z1ZnM4jxWSfimGrAQ+L+vkRHbFs1N4PnAXymXT
         1mhi52Y1N54UWO2KHV8JEDoOKZlDCGrKIWpGfS1Xtu2UfPi0mideK2gteNKFNqM7i/KL
         08HG15YYjMLUXp8czrdQRtqqtfIEQuOtkGC1plN6OcaSVGva7EkWTaG/Ix+SgSYNtJUd
         OxhA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4dOp46dNuGWlXQXl3AxYEGRqw/k8sQRRQ4+DqKA+jScVyEPpKJht3WT6j/bKOOL6Gso15NWF8gT7ONg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa4Oyvj7/VzqU9yz703UI7qK+6MIAuPbiw91xjCUufQSf1TOBE
	CBYU02+enIfwcUl9/a8vLhdgULF5103+swi/B2iTI4ZuZFSsU0T1EYyNU4CpRebTOjM=
X-Gm-Gg: AR+sD13L/EOBZex8Gtg7OKokFiVLX4FqbBoiRukSe3tHD70GV3DEBQ3Km9lSxtQbehG
	AVIzXzDSSuYHy7zJ63yske1Fibmv51FpgG9YDcbRyp+wXoP7nQO4FYkv0fxN+DqLObFXrfa6yTw
	Zik2/roJe+Bzn7CDq3D5huNPmI7yS1FwjUzvgeT5RPe5ABUFttxrksIBQFf3eWHq7kXl/m4Hzqx
	elDSZ89w5Bqf2vfBufo3h7Wr+QNB0tCrRYW7fTerSAMII+rBKpm1V9uev6u539i3Mta2F/EnF3Y
	lpJ99mfVpXmFmfDTRswUW1nNnRxc2sULBOGr/Nqc7l8Y7R7VoLD6yaZJXUlaSBVJX5HLZJrqnug
	mtOUUyiaETj3hdD+5fW6LF9wakbxr8q049Excsx0edDlifXAioKiubVQsYIbPq0OE4F+lm0rwIQ
	wwravmi0NmTs2vB3zf6tH3RcW0u6FtxlbmE5kMU3aXxQn4cbGmLRE6BIxtfmAjkZ6xTiBQSASm3
	5heARFfIdu+HUjTWdQM+k0b5tAu3r/hEy43RSG04HA=
X-Received: by 2002:a17:906:fe03:b0:c12:7ab4:637a with SMTP id a640c23a62f3a-c2039cad25dmr1069635266b.16.1786088776618;
        Fri, 07 Aug 2026 00:46:16 -0700 (PDT)
Received: from [172.16.240.102] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c90494sm19432266b.36.2026.08.07.00.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:46:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH RFT 0/3] Fix always-enabling PCIE_RSCC clocks for multiple
 clk drivers
Date: Fri, 07 Aug 2026 09:46:03 +0200
Message-Id: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ7CIBBFr0Jm7SS0C6o9gAcw7kwXgFMdtVCBN
 k2a3l1Ulv/l//dXiBSYIrRihUAzR/Yuh2onwN61uxHyNWeoZa3kXjY468B+ijhaJrSvJ/a8oDK
 6N6o6UKMN5OkYKOOf9gKn4xm6P4yTeZBNX2GpBXpP+TSVrtExW/0wcGqFoyVhOVbQbdsHfkiKr
 K4AAAA=
X-Change-ID: 20260807-various-pcie-clk-fix-6bafb619e7ab
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786088775; l=1221;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=P7zzdIRqdZ6fveRl0JmvPZyWoaqMv4Y5eD53PVa0mv0=;
 b=6nUDOwWX4MDtcoBuRqGPQRl8ED3ssJ8YK4bG853KM2foduRgdixeIemQsuyWFbia1DbKxeS0D
 9XKMjkiWYtYBzjemuW0q/fr6cIvnhqrYCvtyZ3/Ks51uncgVxLnPuau
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

I've noticed that the .clk_cbcrs list in multiple clock drivers enable
the GCC_PCIE_RSCC_CFG_AHB_CLK and GCC_PCIE_RSCC_XO_CLK wrongly.

qcom_branch_set_clk_en() will be called on each entry which will set
BIT(0) to enable the clock, but this is wrong for these two clocks which
-- this is also why this is marked RFT -- at least for kaanapali
needs BIT(20) and BIT(21) set to enable them.

I don't know which downstream codename (in the vendor kernel) eliza and
hawi are so I just assumed the same BIT(20) and BIT(21) would be correct
there. Please verify this!

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      clk: qcom: gcc-eliza: Fix always-enabling PCIE_RSCC clocks
      clk: qcom: gcc-hawi: Fix always-enabling PCIE_RSCC clocks
      clk: qcom: gcc-kaanapali: Fix always-enabling PCIE_RSCC clocks

 drivers/clk/qcom/gcc-eliza.c     | 6 ++++--
 drivers/clk/qcom/gcc-hawi.c      | 6 ++++--
 drivers/clk/qcom/gcc-kaanapali.c | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)
---
base-commit: d56fa0b2bd2d9b2fddc10e8f5bdd42d56676935c
change-id: 20260807-various-pcie-clk-fix-6bafb619e7ab

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

