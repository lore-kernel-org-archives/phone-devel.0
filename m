Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F83B3016FC
	for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809031; cv=none; b=grfIJ0meTwUEMwMMKRVLmsgMlq0NqggGNtyo+qRnBz+iWeLhwRXE5dA+t89o8M/Z2RRcP5BqpqG/0538Flmwl386t5CaDkvkuPHSh/d4QYi96B3PmkYP2eQpN3uj8g7sBK8BlRTND8aOf6FxoBeP3IrjAQb9USJ+GMbq+MRsKAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809031; c=relaxed/simple;
	bh=TytkM0XJK6cpZlr6ajNYzfLfb5VWH8YjMrlyP4DuW3Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PRi4e05IrE0/0npTEWzPDHUbvB/cvjSWyt3Bd/fJYOHSYiBQQSSjdgEpTZhEkscoytFMBrDuFLDQ50BLuGQuLz65+xc/cGyawUBiUb73ESc6YYgZsJ6uIUnh8sZymVUAglaXt6IyufWq2pxeRmTmyLDLIJCBBt8q3lGXMq+PrPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aENoYhC8; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aENoYhC8"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b936331786dso214480166b.3
        for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 01:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775809029; x=1776413829; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xE/5OZBL7V7EOVLmL+MSBtxCzuDnoarAuDjHIXz3In8=;
        b=aENoYhC8Hpc5D1THSurPgZNkS+9ub9VYxpILeZzcV4RVZmXOJHxUZDvb1Id87rbpc0
         cBBtgzYSpuZkODuQhtsw19WoQwirg5J3eVqoVVyYMKX7tumCFU2ECSWYrXZ2Ggo+2DHB
         lKJ8FepEvzP6YkTA69ByMnSFi05OHdHHrW4kgdnUdpTWJ93UXQN1EsFvOZQrewZ04sJ0
         k00klHU8zxLv30bt2rGj4KyPY8VLTyxyqSUF0oK6JaRk5hYMXqJbIsLzJPlTdQ5En3Kr
         o5iyJzy/sEcWw1AbMb9zhwyoE7VU2+6cBBhwucsDBkPMvWkLKaSPcVS7KoQmKHAxfKiQ
         MC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775809029; x=1776413829;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xE/5OZBL7V7EOVLmL+MSBtxCzuDnoarAuDjHIXz3In8=;
        b=YMfFugWuBqFxpzp8sLda6KX7vki+ovFLawiftPvUO7emBs4chLT63A5i2YidDmevi4
         +lCYDt/dPMhDBCUONkKSjmwgm2tD81rkFfDcgoPzGrWyNmtyqs6YS5CXguETGEi7p0tZ
         td4Squ/eM4sAwkz6twqCmn6McycL+nq3tMorMN/RN6zTY6foBRf2gJklA0RCtzRt7tC8
         E0Qtf4tIrcXfP/yMVhJinnJlYza4vhSlKc7FgIFYO9Xi1m3tcfRB4EjYXdMY8bzZvK4z
         rYajV3U/irLkLBEu3/+bMfQuX/wZm40lRrnDDYYrFszhgs0MoKl5SZ6gTs06Xn/Ni7z6
         O8ng==
X-Forwarded-Encrypted: i=1; AJvYcCXRnNMcHRcnj+xVWyP1JRC6waBsHL0r0P+sbXgWK1jeJM+RaZQksywiQFluIHFobv4QW3cmwwV2208D7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YydG+eOMGLyk5J9CNFnvqsXpItZTjRkBrf/p4/tGos+VAKHSjDo
	t7RsZo3OjuMske0CA0yrRKT3+XfQb5Pt06hU+R7B6epdpd4M8lE3JEYg6GH6voc5HyM=
X-Gm-Gg: AeBDiethz9GBcaDck94HtvGRtWcOq04wKOp1Upk8km0UktDVUbNBYFE4W5470EwE9jb
	pWdmTt5IaIdhTHWNV9rnr4ZAbqU6bTuNksm8k2s9K0RrhtxBOhxS2rpYYGodn9SSm56aWfUMu0p
	MgXiRcwYGtQsri5Qig6rxLap1fagrKK5Xp1EHPxRNq2LPZSBnHeUErWEqXA1ZvEUf6DZfwK080g
	B4gw/sFTdeYik3IhrC8+yTFe/6HKgTBLAMNwVN+RttlXhpNI8WFqz6Nm56sVmOBcHF88DMyPvfV
	1sDspibOCsPwt2a+NqQH62K46azr204FRLkLtuQhzOKb43+wvIHuulWEA3uDf5kWLEdqxkj0fT6
	i2vO/IEuqgLkEBr+subtRgbKnyd5yWpnjOyPBpkCsao6jLtYflOUqrI/iWFmEebxdCdhIcJbxwc
	NNDjbmG3TxxDkqBkq2CiBEicrFCyrxPDKhearCAiMiKf+SHwHcxLgfg+qo2hPoCaLyqPvAzkjfx
	XMyAw==
X-Received: by 2002:a17:907:1ca5:b0:b9c:b3b5:bbf0 with SMTP id a640c23a62f3a-b9d724995a8mr129813766b.6.1775809028467;
        Fri, 10 Apr 2026 01:17:08 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c7c81sm58488466b.43.2026.04.10.01.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:17:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] IPA v5.2 support for Milos and Fairphone (Gen. 6)
Date: Fri, 10 Apr 2026 10:17:00 +0200
Message-Id: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBBFf4XM2jHlJcrK/zAsCgwyRlpsC8EQ/
 t3yWLq8ybnn3hksGSYLeTCDoZEta+VDdAqgaqV6EnLtM0QiuohExNjxW1vkXiKlmUilvGZRkoL
 ne0MNT5vrUezZDuWLKrcKDsLQZ/AjbseglJaw0l3HLg8UTQ6PoRusipat0+a7vRvDrfHnyBiiQ
 BHSjRIScR3TvZFs+lYrOns3FMuy/ABUdUSI6QAAAA==
X-Change-ID: 20260403-milos-ipa-e5705aa87245
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775809026; l=1305;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=TytkM0XJK6cpZlr6ajNYzfLfb5VWH8YjMrlyP4DuW3Q=;
 b=c5DAttZVXDKXca5dJajEtYxfhBKCO5osIy0dsjRH5EDX0HDtg+W3WNHQMweVWMDf+CCPm8lRE
 4RYcCxofdq5A2gi02Fr4PAu6UUH8kqrcHmSd33ExCsgRxBtI/gTHQQk
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for IPA v5.2 which can be found in the Milos SoC. And
finally enable it on Fairphone (Gen. 6) so that mobile data (4G/5G/..)
starts working.

Depends on:
* IPA v5.2 support
  https://lore.kernel.org/linux-arm-msm/20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com/T/
* Describe IMEM on Milos
  https://lore.kernel.org/linux-arm-msm/20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com/T/

I'd like to have specified these as b4 deps but somehow b4's behaving
quite weird with this series, adding many thousands of
prerequisite-patch-id, so I guess manually will need to be enough.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Split net patches into a separate series
- Pick up tags
- Link to v1: https://patch.msgid.link/20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com

---
Luca Weiss (2):
      arm64: dts: qcom: milos: Add IPA node
      arm64: dts: qcom: milos-fairphone-fp6: Enable IPA

 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts |  9 +++++
 arch/arm64/boot/dts/qcom/milos.dtsi              | 44 ++++++++++++++++++++++++
 2 files changed, 53 insertions(+)
---
base-commit: 0190c2c6dae368aeb9bf59a449ebe23f24bfa059
change-id: 20260403-milos-ipa-e5705aa87245

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

