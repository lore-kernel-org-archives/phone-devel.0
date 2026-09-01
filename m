Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8523812DD
	for <phone-devel@vger.kernel.org>; Tue,  1 Sep 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253145; cv=none; b=ef164/7/CX04XQX9/cWyyoiQipxFdk6tr5RNkknTMb0MLJURhdPAJ2OTVo0f7Kwj1yUIGpv6U9+YfqW4miD8g2RcTUahMtr6YKOHhFlxd8u2yCV7JMglyS80lLEEYR8CDlm+DSKok+NjHQZMw1o4glkkaZRsj0lIUZeSlqmaDmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253145; c=relaxed/simple;
	bh=wUOmiA7i2EaKRUV+bEKJTs81gkHvhUOxBuyUyHxqOK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QETC6rTUC7f9PIKd0rwsYkq1iVrOaxd8gzyRlpuLGb3/ycDEBu66xA/+PC3cMnGzG7GwMHf6wHzSpJglyzmPVDqsfkU/LvvCtKTsGrZl/odVaYf/VeT36R8AsIMPVlUQ7QjtewvltDV5rfX8P2JwtSwvAHkpYiKuQtO204YMfL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=h3aOuCQ1; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="h3aOuCQ1"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c255c58156bso801728766b.3
        for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 01:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253140; x=1788857940; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o5o+LGs+bBAm+txc6iMYrrNKuZZMfQFh8GU+2rXK/RU=;
        b=h3aOuCQ1Uu0M0ADm0IWukQ5Q63G0BhhDQXhVYQ4E+hSsQtUgOzqcfqu+uwxj51UaGr
         RiQe7QNrWUpq39F+gOmmlqHhAH7PF9ESldCUueVkTSf1S22v8xCZOBgOoUMWrnrvALEV
         KembkfItZcoVOlUP8sCM4qZqb2jwT566bd4eAlHgI1tkUFmNCZ8LZ4Y1s35vMAQt7eFT
         2HFINOEmb11T3pasU9sF7AsT4iJ9SwdO9LMZwODx0+KnAQgetdKfCtzpwgBGaLYoE8x5
         iwBUuAdMtjEsyt+xoGuRYp2B4tEccE84j/QmaTGAyXM/dxtlSShxosj+cHt0j6WlLlkW
         Lq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253140; x=1788857940;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o5o+LGs+bBAm+txc6iMYrrNKuZZMfQFh8GU+2rXK/RU=;
        b=KHi1RI8AIcMvM9YiCfkbPRtnScXPyoR6iP/jjKde26bL2yYydoasnKoelkTU5rDYGm
         Y/G6e8cZ819BXWNytaO0eRnOXl7fogoDWmU2PwVSqKd6Z6OseKsWMY57Jg0ieccCylKt
         JXXqGSAzhU+Kp7sVUAfc2fqxa9EWpPMGLr3aNapltuljdUA85mdxcl5/sWGt+DUSfiNw
         Dpmb9smAC5Z5+Ci3bOo1cq4+p1c8M+/RvfcEJHHvy9dUuBQfzfjmJO7YvFiw4usUN92T
         t166SFNNssBOIo0HPTuKuRw2DM2xQEFfA5iEuCFc/vfRkYT1pYGeIlXoTScUgpoqHNvn
         DM6w==
X-Forwarded-Encrypted: i=1; AHgh+Rp9JdOh5yfrBIWi7pMM+kuDJ2jt8R/SiQzInuDgtlNHD+XN3C+/T7yXtEKlbh9ATzue2/0T8HjlYX38bw==@vger.kernel.org
X-Gm-Message-State: AFuF++kRZjktOoEnBUjDuLwhUn1oaWZzcVaBVBOGrDTdJcO1zZRjLaTH
	qzrlp7nWF6mSo/3hkeHx9FRt+V+aeOUwv3IuMh+clpYrTSyep0qzQfTH2BFaA+8Ch2w=
X-Gm-Gg: AYBFou3iSC9eTuQIm3wf6+C6S3+NzGZ0kSIz+SQAbqQSHtVKMG8Lxe2owwtda7HNzUy
	eCqfu9/5/ff77DOfHPdkFX9hb8O+4/ojjdhkQpHwyA7oFUDxpDS0coAzDVOh/EJW2AIqYXS3MIb
	nL2cEfm6eS84lQSjMTHukGRxkXz/PhVYwR9FdIDk+/OX6kr4ToNqqKIikI+pC5v+OCVOYiYoLzZ
	fXatyfwBBhkmZzUsPEM5GCra6+koOvKILGtHph1u415E3D8r4TSH01gGkAM69wm6kesmZtyWeu8
	iZzPdbi0nUWJ9rCmStH9l4s/wYK+H1IBK1YsLHJ5ZMrddBoklmzcEzS35Z9yIIriXlQEo8XM5cH
	kPs8Sdnsl/DnnkVkhyGlUymFbCjQykMd+lIqYClCRuAvpm26zOrIjTBWLUq78DyYJX6EFeOEZhD
	E7+Nbck4LCLwFwMa7wHRVtgJI8nZVYqTRcjqSEeApJE5VHzKHDIneSNu/FzQsgUYAnzdl8YaYbg
	z+cRwXZgqRWpKtM39WEAKHdnmCBjlOoPLjFM/xDM+g=
X-Received: by 2002:a17:907:728b:b0:c24:680b:3944 with SMTP id a640c23a62f3a-c2557169784mr1987875966b.13.1788253140425;
        Tue, 01 Sep 2026 01:59:00 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2564e314a1sm511942566b.42.2026.09.01.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:59:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add supply names for PM6350 RPMh regulators on
 Fairphone 4
Date: Tue, 01 Sep 2026 10:58:55 +0200
Message-Id: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAyA4VeRnBeoRTqyVxk7qEtdRLQkVjbEd
 1/djt/h/3cwVmGDW7WD8iYmy1xQXyroX+08MMqzGLzzwZGrMaYGlYc8teuiaDml6YPXGDoiYgq
 +gZIm5Sjv3/b++NtyN3K/ni84ji9W4RMUeAAAAA==
X-Change-ID: 20260901-fp4-regulator-supply-7f6b999e9624
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253139; l=899;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wUOmiA7i2EaKRUV+bEKJTs81gkHvhUOxBuyUyHxqOK4=;
 b=z2eqSalHbGfQjzg71aMZg7ujz63UIPZr2SrhpswnbsCCa14W27/nIzJt0iuISGhF0S2inwisN
 7Wb3f10VUziACsCVq2rcq+yvaJ2WQiuMn8q0Cm5JxWtP+/gDDzSxrE1
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

During bringup no parent supply names were added to the RPMh regulator
driver. Add them now.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      regulator: dt-bindings: qcom,rpmh: Add supply names for PM6350
      regulator: qcom-rpmh: Add supply names for PM6350
      regulator: qcom-rpmh: Add missing regulators in PM6350
      arm64: dts: qcom: sm7225-fairphone-fp4: Add parent supply for regulators

 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 16 +++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 46 +++++++++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c            | 53 ++++++++++++----------
 3 files changed, 90 insertions(+), 25 deletions(-)
---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-fp4-regulator-supply-7f6b999e9624

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

