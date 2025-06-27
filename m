Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A4D21A459
	for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007356; cv=none; b=hKMpemdUqePJAibYtvMEOYs+DDXIgGqQOQSa9aYA8NiTkIIGwvQqCy55R+4hYp3bmvmwryW/6gvaCJ/MfxSEQN2nJxaZyxHyD51NMAMmWOM+6id8aLqjrbpUwtLH/+lobe3BKbbphltEaeJbK69KTp9w0ELhfV1lNBXVH+y40Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007356; c=relaxed/simple;
	bh=HRKYSDD5aEl3fpXcNcNVmNhnN9+cdeRs/Hjz67cr70k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PZivwu9STE6nZOIwC8WIH4ICvDcf8tMYK1iPthNxm2uJRg/hmgBGi2T+FWGwJzcE1kXZDUQgHhiHup6EJr8iGNJOVqa/C+km0TAc4It/4CZXmuDP8rlr9WwwQaSKI611w5m4MOUFcqw1wo995oNFzZqXPxvaIULokTkWOpLxIpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VB/lAK4v; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VB/lAK4v"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso3400286a12.2
        for <phone-devel@vger.kernel.org>; Thu, 26 Jun 2025 23:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751007352; x=1751612152; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6OyVyTnLvcUYUCVnJmVzdUrEtcXIeCg0NCslSbzPGUI=;
        b=VB/lAK4vM7G3sAZEijjfiWt5SIZBy9pfIRGW++FiO++auOKOvSXUCXKzXw0AvYL9dN
         oSAMsS7ViwEYtotB9aVLNpuA6QBJdBPG9mOXTksBDn6WFp8bZmZYtHIfv+ggoXSsOebM
         7tmMAIkNkJ/ElZm3BIx7ol/q0a6hWrlts/LJYYqv/XOJTUDAQjnXplDYNIXX0OANqno5
         hSeSOgl8KoR979VOBSRUjgXE3Fj2/j4055HrlgBF+FNrfNqdgkvJCrnVCE7FVdgqXIyQ
         PCmnVQu7z7B/nCfHqg2b0p9XYWS6mKpJGqVk0wndAbFGX6v6oNIp1RmxeCid+5KyVgqx
         JqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007352; x=1751612152;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OyVyTnLvcUYUCVnJmVzdUrEtcXIeCg0NCslSbzPGUI=;
        b=tAzX8v2OIpsMJ+a3YIcFG3ZnztbxMezd5SyCi7HFcBwsfY6OkryxIkkbrvDsgsf2dW
         TSVRDXF6PICnPqwdrD5EINj3gQbhTZCF7ysbs+6KH7lKawTon/3z8cTpzxJq3Rt/Il5i
         r6EvXjhVnYznPYT1yt7Btn7uGu8AopDzPwPnieRPGbfx7I1b40DwX21XjkJ6iSDnGz1M
         mADhK6ymeLo6wQKIboD+blkI4eC8lTZXSSCT4bO+0HLOf7H9GLB60tWlV579RJdet5jT
         hRr6kL83jbnu7pF3i/p2EvE2Xb6RQOfTEJyOOGs82bVPHjp6qbTfDVwbYCfSlNiau/C8
         HHEw==
X-Forwarded-Encrypted: i=1; AJvYcCV6zwRDKjw9GJPhuIsAhAGVtb3x75rb9+STSYJjsxhim7RIInmuM7RYAxOurZoWrjjNfG5Cfg9iTU4PcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIo6Pz4GSti/VmexWRw4NJsV5bD1jme54noKPznIJiQMVuR5al
	sRlqan/XEBN0Jaxjo1CnSL+WxIqV7m6LK0f9BZfHlKHLA8QOL09bCXen9u512n+HRrU=
X-Gm-Gg: ASbGncsnZ4J93waUK3vFhXEI7JELlSVGG3OwtyOr+ovpUHg8MfKamcWXFF4GPpiN6EN
	TPGhS6lVk33JBc6Kra936wv1dq8jJgitz9GIwlf9zwHeTctObT7SJVb3SlHeMKMFoL/Sx+DHhW1
	mq79SHdOLrOKW7dlKpDX3CoPRAZlxTIXrO6g0bSNChzlT/xik0GeEoHlku50KgH6BIOZb30YMCQ
	YTdr+w0AUq7L1wRGHeUvnVt734l7Mfof1y3aURG6E59G9r7hxYuN+eazArS7aYbU2LRIiBCXvzY
	F+u1kZqS/8NWHX1YV4wmbvwBhRbwT3/F+VSo+zrhAbp8hH5d8ogsxIed7d6xHTmaxE7ZLcOyDHP
	Tya7j1fvQQfnMYZdwzgFsAqmVEGtr21NL
X-Google-Smtp-Source: AGHT+IFjnOE8NEuOzdjShiuz1TfX1GtkNhAVAt609Dn5g7Pd0R6rLxmR5Tj2cwmvAKPv7UsDwUE7JQ==
X-Received: by 2002:a17:907:3c89:b0:ae0:d903:2bc1 with SMTP id a640c23a62f3a-ae35019f2e6mr171046566b.49.1751007352601;
        Thu, 26 Jun 2025 23:55:52 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290ffb4sm1019451a12.36.2025.06.26.23.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:55:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Add support for remoteprocs on SM7635
Date: Fri, 27 Jun 2025 08:55:41 +0200
Message-Id: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1AXmgC/22NQQ6CMBBFr0JmbU1b2oKsvIdhAWWQWUCbKSEaw
 t2tJO5cvpf893dIyIQJmmIHxo0ShSWDvhTgp255oqAhM2iprXRaijRXrrSCcQ4rRg4+CWVuQ+e
 MrE1fQx5GxpFeZ/TRZp4orYHf58emvvaXs/9ymxJSVKUcXG9VpRDvY0ccp7Dg1YcZ2uM4PuKRx
 qK4AAAA
X-Change-ID: 20250620-sm7635-remoteprocs-149da64084b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751007352; l=986;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=HRKYSDD5aEl3fpXcNcNVmNhnN9+cdeRs/Hjz67cr70k=;
 b=pH1MuTyeCcISIwj8Evc1Kddyilr/htJ3i7P0g83fcN7B7VvBPn5+W5za7kTR2IJUmlQc5yJgO
 jM5GlQbE+RkAuwkGek1ngqy0p+uMBqjrAOkKxBVRZgkJ+P6UqqgG/XP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the bindings and driver for the ADSP, CDSP, MPSS and WPSS on the
SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Update default firmware names from .mdt to .mbn
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com

---
Luca Weiss (3):
      dt-bindings: remoteproc: qcom,sm8350-pas: document SM7635 MPSS & WPSS
      dt-bindings: remoteproc: qcom,sm8550-pas: document SM7635 ADSP & CDSP
      remoteproc: qcom: pas: Add SM7635 remoteproc support

 .../bindings/remoteproc/qcom,sm8350-pas.yaml       | 19 +++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 37 ++++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 24 ++++++++++++++
 3 files changed, 80 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-remoteprocs-149da64084b8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

