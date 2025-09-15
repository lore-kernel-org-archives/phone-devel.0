Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D952FE07E
	for <phone-devel@vger.kernel.org>; Mon, 15 Sep 2025 11:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757934939; cv=none; b=WNiAZdDEYkXP61X4APTPIs+8BPgSGh6/wA5EYu0DE6AsAgSaDDZG33T3iI5aVwu/mFvHn/Orugfx4LDrajYgdD8qCoOf7ERfRLh5V0rVn3AeliVh5IJCTXocHaoH4wNcbEGacO+vsCBxeEuTZrPEz2g0j34yzstPBh519K2D/0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757934939; c=relaxed/simple;
	bh=hyJFbE9CxuOjX45Et2d7t+4UbbjB8uE8hXZbBtpCcl4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hk0LAA0QnNOXjbskV11JSsqoaOujp3rKtTfLQg7pJ3vXHrdjM2pMhUQDFHARijno7jHIg1eh+1XSYIod3hyBVFtsZ+2ZcZXuRhtfpriwx35gpeqozJLXqr/y0WZSV/isnICaSu9zXMVRVtPK7p97qOjCcXkLK8dJLai1k61Fwsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nsHYZiSD; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nsHYZiSD"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b07d01fd4fbso369806166b.0
        for <phone-devel@vger.kernel.org>; Mon, 15 Sep 2025 04:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757934935; x=1758539735; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WSDSpRxe7vhx8m0cBW/hKeYQFhJF6BvlymOlPqDP5xE=;
        b=nsHYZiSDMinw/quwYpCkR609GCnDiT+7h8Cjr5TkgBArIbWL1fm/fJSQZLJEqgYHeU
         K/APOt2QHHp+NhCqafbO5GS+fGbISEJ4s90cZE7YAeFDVJSkHSAIgnH9Nv7k5VrjttXf
         /sKXCKCUucmZx3AuJsTJitCcwLh77vzkLsHbe2YY068ftFsqDtB8sZ8LxgfSAmp+Kwgc
         xwq/ZV+/V8nwwAyKpgk6GHBGRHDiqX3GN/kFeof+ZHCx4RNPyFTbAlXg9xscioGrwQCN
         HRy/Fh5i5LNKs8l6YI5ktsSRDnZHVlZ/+2Dz7gWL9sM+foKQT+OmjEoBBlHib1ICI+WK
         E/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757934935; x=1758539735;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSDSpRxe7vhx8m0cBW/hKeYQFhJF6BvlymOlPqDP5xE=;
        b=OBArBCdZCRJcIfe5Hcjb4mCsjxbzwmy+G60U5ypq3hmqHLYmrXoDmhfAHrXkaHm2K+
         O/K2uhLjn3TPx/iK9GUMChM180t0VBOoLnMiFNAWRxg9rjoBUZIa3WgBP4Zhz16f5Jy7
         3r4+AldsptIuif9u6XdDnjsNr3sQWqdqp5KzZWixAwxjvAFjxYlC9i4yVx1trpuPrmVS
         K69Y7RRHsERmUjsWHKCh7vRIjvT8FLOgQZGWq6bwa/9jd6XsLf9n8cYC5jlddLZjccGh
         0+Fw26Y1U1U8vISjVw9owK6U20vBKDeDE3tnnOQygeoQv1bm0nYrarnYfIgpvjTXYmO5
         WyKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjuCZiONFSMueCiIFZgb0fkHgCJDHZqsHqJQSWLaSUJFlKDWLpEjd8NFl4W1cC5w/h7vhMZtctyOx8NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbaBC+hJsGqkB46nLB5Kf/uPojMF1kFBaFsLP2yadLy1tnD32Z
	j2V+aj2wKwOFXzcTvI+esGua0tpkVSZI3y4hDvplnoB333AXviV3wMBwUtHNzhan+Ts=
X-Gm-Gg: ASbGncu0RejVrN2oPmGfNnJK4lkN/3iwvc612DLa5YUGQljF2nbRakhxU8AtLXGkFeg
	3kpIAO6hKyvr4WAPsaToAEgAue3PKxgTzXt/jyhjPKkN9eLKhZjQ2r9RJePNJrOpRzQtaO2tRKc
	jtndLAKeByVcf4TnDrwSCkmpPeXDot5UbOW/p/OShlt1UeslI2nmh6JZUXOtccV3KgtrQV3cwUk
	09NdbGqPvyVDomuoKWsKV5823jbKrIjzf+6N7gtEEphEZS2nQyUfqVy/zHoWdVmKzFdIg5rYJGw
	27JTChGCTg1XL6c0F90S8myB5nY5Sk19B9nSVt15hLPXc8h3oFXLFZ+eMgOolxDuBfWjGn228pf
	YYvO43kLnpp3NW20P8wNpgMrhZ9I+dhzu0uU7+Ll1xABqAhcfcYjs80S5YfGOkAAvBrGRhdEKN/
	1JWMc0
X-Google-Smtp-Source: AGHT+IGywulimHhQJlO4Rta/TnERJN68O5wo9pU23FIpHxPwMOlZqSlAaI08bgPpXbveZOPsK2ZKVg==
X-Received: by 2002:a17:906:d554:b0:b04:5895:fe8e with SMTP id a640c23a62f3a-b07c35fb500mr1263150466b.36.1757934934697;
        Mon, 15 Sep 2025 04:15:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07d9e18c24sm561851366b.61.2025.09.15.04.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:15:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v5 0/2] Add support for remoteprocs on Milos SoC
Date: Mon, 15 Sep 2025 13:15:17 +0200
Message-Id: <20250915-sm7635-remoteprocs-v5-0-96526cac59c6@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEX1x2gC/23RS27DIBAG4KtYrEsFmGdWvUfVBeChZmHjALVSR
 bl7SawqVcXyZzTfaIYrKpAjFHQarijDHktMawviZUB+tusn4Di1jBhhgkhGcFmUHAXOsKQKW06
 +YMrNZCUnmjuNWuOWIcTLA33/aHmOpab8/Zix0/vrLyd63E4xwWokk3SCKgrwFmzM25xWePVpQ
 XdyZ38Z1WVYY0iwguqgXZBTjxmfjCKmy4yN8YaPDoySVJMew5+MIf2leGMMMB7Aece4/M/cjsN
 lOH+1T6jH9ZCzBXCrL7GehhUuFR9DKGsdtx8HjPknvgEAAA==
X-Change-ID: 20250620-sm7635-remoteprocs-149da64084b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757934933; l=1536;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=hyJFbE9CxuOjX45Et2d7t+4UbbjB8uE8hXZbBtpCcl4=;
 b=c9kaWiVTeM6gjqdm4+aAditUZF6OlBbcBbQU6dznmaG93q+yetGzBY6GLz/EwKawOeAs452re
 KixgzXs73GxB0d6gfYIlWLzquRRv7+LJVBcBqc4HeWMmGYzlmGMt/0e
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the bindings and driver for the ADSP, CDSP, MPSS and WPSS on the
Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v5:
- dt-bindings: Drop firmware-name ref, and maxItems for
  memory-region & firmware-name
- Pick up tags
- Link to v4: https://lore.kernel.org/r/20250905-sm7635-remoteprocs-v4-0-9e24febcb246@fairphone.com

Changes in v4:
- Rebase on linux-next to fix conflicts
- Link to v3: https://lore.kernel.org/r/20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com

Changes in v3:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Replace additions to two different bindings by one new binding yaml
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com

Changes in v2:
- Update default firmware names from .mdt to .mbn
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com

---
Luca Weiss (2):
      dt-bindings: remoteproc: qcom,milos-pas: Document remoteprocs
      remoteproc: qcom: pas: Add Milos remoteproc support

 .../bindings/remoteproc/qcom,milos-pas.yaml        | 198 +++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  24 +++
 2 files changed, 222 insertions(+)
---
base-commit: 51095600e8c19d53729a7fbd273abc4435a25e9b
change-id: 20250620-sm7635-remoteprocs-149da64084b8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

