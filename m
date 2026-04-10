Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5344033F5A4
	for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 07:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806824; cv=none; b=ljBFxNheDFBswLFl6oeagsp3FXeHawFewVgGicyNIvgsw3U1EklGSicyRU4eguSTrnCPZhMSgyXkZsY7gF8v43XcrpVllWApNv/LwVCZZKFhwT6cty+WvoUV7AQgX5ozzDpYtO5sXz2M2UVbfmKyzFUEnUhrHHmwU47rxk3ZjBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806824; c=relaxed/simple;
	bh=8UVGLM3tCk8JI921O45NinRZAOpPG+OzGI1sC+NEJG0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X0/+rnyAF0Kwb044BX3TbJo9+Y+Z/KjV/wnkMhg7zjqW4aAAOO2Ntzs/7QKzEMhUFXMlwvzft/lW7QMQ8xTrxJQO8aKZnUtwpWJqqid1v1APX5xk4E1GL06MCJ+cvablZUpf4XNI4zshzAkeCCx9L0NUDj+6awvYjwaPcDUIRVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DDqneyPw; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DDqneyPw"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67011a751d2so155981a12.2
        for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 00:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806821; x=1776411621; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CdQm+7qKkQGpWz/x294jzIY9WDuqqRzuW6cUPd5hDXQ=;
        b=DDqneyPw+A19EEwKb72/XWhva+QCysn8VkRNUpuyMzvHReEm8wronogJpULCV29X1a
         dQub90M4DlVhSSTYCWDXFl8sGKt7SlSrmhyZ4pOJUsQuVXU/Ez9J0ZzGXYQbTP+pKyqw
         NDyjoasw/qa/aTE3I1xWz9edsqFsxmbk18+/LGuQFZag8L2lF57F0DnTFl0nSrk/GGib
         M68cO33vggQPkkNeOU7D1hBr9VvcGElUvVZnJemYDgC+gIEAHtmifMjkwbp/Xai3TleD
         wkqPC6FjkyN5I1FF4fWvFa4VWrDO1qyHhxC7tTkG9Iia2DEtayXyShOS8IPqU2GhGJsL
         +vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806821; x=1776411621;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdQm+7qKkQGpWz/x294jzIY9WDuqqRzuW6cUPd5hDXQ=;
        b=cSfQYwIcxBHY0ZaYcDN/i7jf17wOmY6Xk5r9xctis8B4Zvlm38NFSzOPxHCYu9ROX3
         5tFv+N5iWp6j+/jIDiYR0fcOkuxDdboT5f3WUSyyh9B92QXfp/NMpV9+6CffqAK4en1W
         dvMwzjwQQdfj23+yIDYKtzg3WmaRFyP8fHKR2qoulvcaUPnlK/+7ANcji5mAYpbFeAVN
         El5WVIVgewOpBIxy9YqX2UxlAj83PPpCmaxzBWdARufx06T/yjhAYMuNqxG485Y2fSGC
         y0U2i3v6BLhY/JA3auG7twYIu5Wz3Jv1mcSgPM77fzzw83wKUe/PuruV5ZhJRgZKQy5U
         bEDA==
X-Forwarded-Encrypted: i=1; AJvYcCWQhO1ez0653XQtSTUyyydXD3i1l0VtwDXqcnUusGYNendsFAPsV+G/bWQ6KKwmzUtgaxUiU+IStSHWAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2FH1kGeh3JoCZMkGTwWVODLALH5cU+zlVyMAFU2BJekRRBehe
	77MWoC/e+xp81uq3VYDR1Cj1TC02ulVQCXlF7JEksyB0mO+6ZeTCTciJwN7nOT3cLl0=
X-Gm-Gg: AeBDietueOG+v8TUoNki568xP95SCmB8bC78mSVMFPRRpeCg5qmDUtLnzOB1i2ZnGkn
	FedpabQ9eSWF2fyNNQGTYRz3LAqWdqyEaMMmx30pDNJ6As4BF55MQFh0pkaSTk1Q2tVQ81MzW/m
	ig0cMw+tvPTrTQCTzSe9ZfRYOsBGzxsKBWJ9o6HIMmrUnceqdqBM28DhOcPJpfPEG5KTwvOyTZT
	tPd3W3x9lPQE6G7tvDVQiulnNtJK/IEuK9BHbXwgzyR4VnhGUxgcGdfHYz68oe0Sd3B3tDYt3an
	D1Uo9sWvU+lBLFcBelijevhJecDw0jTMGEHL08TcQd4dI4lUVUuJy9V02CY7JJyILWCQogX+4u9
	9b95BIEYOcr5AZdqhWWyPrNSSU0y1hEo+R9D3ATUqcbCD4l4r2dIZiDC84o2ORtzm+Mn1bzGuxc
	KcYy0j4uSXqOQXZtLaMsfS31NsHJxFeId8C2Jv5mRYVCPatYC40QKVBMtdy8J6hZCKKkUHkOy16
	P8OAA==
X-Received: by 2002:a05:6402:4548:b0:66e:44e:3103 with SMTP id 4fb4d7f45d1cf-6707931e447mr686513a12.9.1775806820681;
        Fri, 10 Apr 2026 00:40:20 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815a1dsm400310a12.22.2026.04.10.00.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:40:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH net-next v2 0/2] IPA v5.2 support
Date: Fri, 10 Apr 2026 09:40:06 +0200
Message-Id: <20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2Nyw6DIBREf8XcdUkQUNRfaVzwuLQ0ES2gMTH+e
 2nrcjJnzhyQMHpMMFQHRNx88nMogd0qME8VHki8LRkYZS0VNSV+UWRrCCPWdZIyrTvFNRR8iej
 8/lPdIWAmAfcM479Jq36hyV/TxUZ8r+UtXwOtEhIzT5PPQyWY67UwLbq6R1lbZqTttbPcNJRLK
 xwKLpSVMJ7nBxOCLQTCAAAA
X-Change-ID: 20260410-ipa-v5-2-df8702bb8a3b
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806819; l=1265;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=8UVGLM3tCk8JI921O45NinRZAOpPG+OzGI1sC+NEJG0=;
 b=e568NAGenV1WUAKn4vo+K9IN+7el7pXrpPW+HhtT5w74qciWXF6gyyTjTzbDTHSh8Coul31XR
 KQx+9WomOv1DP0aQNzeQJd4US2vLaTjWPNIWMMudNGMMW4Hb7pwwlDg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for IPA v5.2 which can be found in the Milos SoC.

Note: This series has been split up into two, one for net(-next), one
for the qcom dts bits.

Changes in v2:
- Split the series, drop applied IPA fixes, mark as net-next
- Pick up tags
- Link to v1: https://patch.msgid.link/20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com

---
Luca Weiss (2):
      dt-bindings: net: qcom,ipa: add Milos compatible
      net: ipa: add IPA v5.2 configuration data

 .../devicetree/bindings/net/qcom,ipa.yaml          |   1 +
 drivers/net/ipa/Makefile                           |   2 +-
 drivers/net/ipa/data/ipa_data-v5.2.c               | 452 +++++++++++++++++++++
 drivers/net/ipa/gsi_reg.c                          |   1 +
 drivers/net/ipa/ipa_data.h                         |   1 +
 drivers/net/ipa/ipa_main.c                         |   4 +
 drivers/net/ipa/ipa_reg.c                          |   1 +
 drivers/net/ipa/ipa_sysfs.c                        |   2 +
 drivers/net/ipa/ipa_version.h                      |   2 +
 9 files changed, 465 insertions(+), 1 deletion(-)
---
base-commit: 42f9b4c6ef19e71d2c7d9bfd3c5037d4fe434ad7
change-id: 20260410-ipa-v5-2-df8702bb8a3b

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

