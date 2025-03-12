Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E0C23C8B5
	for <phone-devel@vger.kernel.org>; Wed, 12 Mar 2025 12:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741781117; cv=none; b=Y1bpo0ntHp0VHA92TzMR//Bc3qPi0OoOW0MiXuXfu/1bRyFV5p5dVCFGcFfOPA3mOH18arCVvsJTB3jXGlc9qJ9h0ukd2dxD91pBXOUuFPvi8XmbGAtd603WZEVvRCOgZNrozzsuyuG3vQlVNdlo9HVeUJYfrQiOcjWyJvFDz6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741781117; c=relaxed/simple;
	bh=s18H99Qg8l+CBnR31Xn4OrMryEza5CUNK6AGHXXA8F8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q0K8YXgwtNOS9WjPHZeJ+hnVH1nlVVysQ0me/MiNq88weAN5Qma9csPH3tWEG7Q2PN6fnKVliegVt9bGW7ZtRLM6OlHOuLwnmPn62qLqU/RSGsPzV9/5mN4dLQEHUPOWLxk91fAhzst0VWeB6G65BfmiWmsoOonJKoQXcJSuZyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tcbA6y9K; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tcbA6y9K"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-391342fc1f6so5252252f8f.1
        for <phone-devel@vger.kernel.org>; Wed, 12 Mar 2025 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741781112; x=1742385912; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y/qhahxkC87okdK8vzcBKv94aryasTsuguXF0TtMtHg=;
        b=tcbA6y9Ko0x5I1zla4WCuRnqVdAGHiWV56EmoqmAiTYOT3WuCwBoQ4VGtLPjuJVqGq
         0M0hUP4mow2RH2Uow/JT1qZUAQmsBHtMSw22Xuy5VMkriZx0YOBIFcxLarEODNswe+Cz
         Y5/ZhPNWNMU+GNIrHBvt/GZ3Ei0cMLdwM3TKcrXpa7Mfyt4sb5uAxUAJslZGyr4AYWBs
         5X8WojC0jVY73FZQokvzAUtgAmhADCZzl1LVzhZFahFn32SSRAj7/praH2Pf8apNrrnr
         kPdI5fBcRi5CVPWiz6b57AVlKygKD0quuj98FNaqvrArrOBtHiewcmDC95Tp7hCDxnEJ
         dPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741781112; x=1742385912;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/qhahxkC87okdK8vzcBKv94aryasTsuguXF0TtMtHg=;
        b=alICcxjbR3pfblQXzUpHgDSpZZq1329TuPJ1+vUhPNraoLAJISASiu3DUGKPjKTziE
         rAxPh8YjYNZ6RB7UZ5stC8rJGFAscjmU7c4VmgCVEiNMkhmNe1Ca/KJQFW07BFZqMOuS
         LaAxNNUNl2djWxHoty9fRdXkyeZfeIpEfUAlqxj+WVYvO2dQAKDF9PynOiK8UN94XQBt
         9KNxWFdh3BjAqz3wxVIjKCBsk0d2Nw17SMz0CfxgrxaLy+vgiRfmTa1jiYe8SwCOFzlj
         zeCjptAx+JSztZtdx6zCaphPDzmoplvdcyoeGHurg1w2dxPFkXB2yWOSOg/lzZn+T6zt
         hbrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfqUje9Kg9rpSz66nLoWXn75hCLsLzs2DttUz1aJQmoUFBsBIvwlhjMtNdlUCw11uw/LoMo8XialfETA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5eZBb+gTPBGCr4RQbIMBhS+trah2Gv6hvGD9c5+dIF+ZzlET+
	dkaHHuB8SGdjHeOI5vq45ZMBc3V/XUK7IP7Up6erZ18dlvbVXkH6rk191Xff/6c=
X-Gm-Gg: ASbGncsaSR7m6JHtoTZGpLCOUnqcLjDU5TeMdJC2S1vfekBk057eF/UOPcec9tcxMC2
	FTkD/iIHS9M/OK9FFhCrayXtEkVtE8HZKZRFRpfjELphXDG8F2lDsehlrnTSu7jW3ObEvzyi7YQ
	7e2oVewLDt6cjlyTM7xaOaAFhutU37SiWOgi4bpjS6Gj4g9/vLyfudnmUOoGePmj2IPV5Gyn5CD
	Dq0GfWtx0ffExl5xv0XzuL/GnGd3h+ohr6hHkx3mX8EMsOD4owQt8nnObUO3nGAIGTOz2itpR30
	unbrdcYdOxNsSP4hKTns4zpN1B20mY237hBN4CnRslBHIRWlIL9vVWVeO+qJttcE1nLqPObZkP1
	+ZQ8qPfMZn1iVWaTNiA==
X-Google-Smtp-Source: AGHT+IGC4xxP+Z3Fdvh6MXVOV92VRfrBtvnApHrB/c9+vstSSu3u4t5eJnb+88jYtJPAaZNUMHPC5w==
X-Received: by 2002:a05:6000:1542:b0:391:a43:8bb6 with SMTP id ffacd0b85a97d-39132d8cba3mr18453006f8f.33.1741781112389;
        Wed, 12 Mar 2025 05:05:12 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb799fsm20810608f8f.2.2025.03.12.05.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:05:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Fairphone 5 DisplayPort over USB-C support
Date: Wed, 12 Mar 2025 13:05:07 +0100
Message-Id: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHN40WcC/22NQQ6CMBBFr0Jm7Zh2kEpceQ/DAsoAE6VtWkM0h
 LtbWLt8L/nvr5A4Cie4FStEXiSJdxnoVICdWjcySp8ZSFGpSdU4hArDLBbHl7gn9gFJm+5qVH3
 pmCHvQuRBPkfz0WSeJL19/B4Xi97tXqsUkflTWzQqZGOM7svaVGTvQysxTN7x2foZmm3bfnUqg
 Xy2AAAA
X-Change-ID: 20231208-fp5-pmic-glink-dp-216b76084bee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

This series adds all the necessary bits to enable DisplayPort-out over
USB-C on Fairphone 5.

There's currently a dt validation error with this, not quite sure how to
resolve this:

  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: typec-mux@42: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
          from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#

See also this mail plus replies:
* https://lore.kernel.org/linux-arm-msm/D0H3VE6RLM2I.MK2NT1P9N02O@fairphone.com/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Move adding "*-switch;" properties already in earlier patches
- Move wiring up SS USB & DP to SoC instead of being done in device
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com

---
Luca Weiss (3):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
      arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over USB-C

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 103 +++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 +-
 2 files changed, 104 insertions(+), 8 deletions(-)
---
base-commit: dcb11dc4740372cd4cce0b763a4a8ec4e9f347a6
change-id: 20231208-fp5-pmic-glink-dp-216b76084bee

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

