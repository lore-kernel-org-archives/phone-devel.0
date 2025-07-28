Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AC5FBF0
	for <phone-devel@vger.kernel.org>; Mon, 28 Jul 2025 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753691737; cv=none; b=clE6QgRZ+3ftcEPznanSrwpxvOK61UBAiddYBqmWUqChV48qSTzjN6M9avgMpeov2VkehZ/nkMHWSwBBODTrCCbPc19X4jPmITaNLcMvMjqn8dOKuWv2Sn3ByZmKgeZWejB5lGH1jG0DZTCaky0bLnLPqORw35U+wYSMW+HFFSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753691737; c=relaxed/simple;
	bh=uq+ImxcXIDpT7koBCX+UcC0xIpCmcUr0MukPByOa2Mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QBBDFI2fgxYivrYzz4N+qBbyw6W/kq05+MUs5Nq+XLlESZcsuuJ2SpwJ6akWvYpoP5WM4t5m8IaSPa46RkgcTDkEPFvd+0hAn+LdMaMhyvTchUuKhRcYZA9jRX63XAjK+QD6XIlYEBiAEK75sBpYcGPCIMhDtIJK1OyZ8yf2XdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iHO4WXGY; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iHO4WXGY"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c01b983b6so8853370a12.0
        for <phone-devel@vger.kernel.org>; Mon, 28 Jul 2025 01:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753691733; x=1754296533; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O+GMtvbjmv8Vnpzhp5frnyGTe3+Arr4kqBd4arPc9h0=;
        b=iHO4WXGY17tmTrWpKiCTGLB0bjUBddLJDr0B6lBJppd1FND0bmlXlIFlRHYNPjL63P
         M4YQ/ceoa2KK6x+u2Nr4KaRCd8ZyDpk/9NRR0l7ysOKUaZBwmVXtt4lzEKmm6ojOTO9n
         2uk4//BrhSc4jCSA2F5UtreHjuGO76NdbCU2hzAxRO49pHtcljQTc3ss+q4yNYDjwgdf
         xxiT7bfZD4gmiJ6qglL6OUHql5BUidfOyykhzo1X6ddf1eHJFLAvVVyIxVGwebxAtxFC
         px/xQ6YNoESAEQ2iq0+H/2C1flqfBRpLSX/ErTewbva/XOueJQIgDIQv21D3667OAEd4
         FBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753691733; x=1754296533;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+GMtvbjmv8Vnpzhp5frnyGTe3+Arr4kqBd4arPc9h0=;
        b=o+uw7W2oQ4u1pO2SJ8eT31YZvdhMmbQ4usnPYZfT4GkweLpNc3pukkpjS+MxAL5/fu
         KUKGQN4TvTBnyFxsLhzkIJ92Vo2uPdX3VxnoEB+rysIeNtr5CGMdL8b4MiW6kdTzcOUr
         oHBHz0Ih/bI/K/E1JzBq1+3sxjRcQssMtgGm9LwwGAeqLOBf5uoQIGuWTqeq0vdGlm3W
         g4Iw2mkvDD7nBk0S08GMbXYz5Lip3dQaITlZpyzXDYr9zuEKbxG5IoTG+YYZaKV28Nem
         S595bUUqmNn0shRKtH4cdvs4ye7JrJWB4ARpJ05zF1KRv27jrUuJ6TOdFFGmZGFy2kPI
         eVvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6TZk6hDKpCp37+TIj+iU77lmt2UaJVDt0tePRDEXhn8j6biYASYJaDjIZTtpiLNNbKvNV45J9Y97eMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWCT0xtAyciFplOYXfJ8QeU159EBibCV+HxnJVq8T33vuJx056
	X6ZpGn5/Lp4OUTAZn1b033wPNQlcLSCmO4LmcpS0KewVziNkYuTbr365gQ55/1E6ZUfMF9Mg5kI
	2G9zB9V0=
X-Gm-Gg: ASbGnctDQSWjs4UPO7K6/r/DlvmU1yC5Hj1srNZeiNXrnYN0HAZtC1M8IrF47mCbNUg
	XNi+i0QWS81pmSBVFiwMk3cnykXgbZlaNfBHfb66mXEezBhOQcdEC0RvTTwtnRfghvkLzFdsXpg
	nIvtZPP+4haK6Snt44D2uQzZcvnxYLCvaNUlZEIPTdJLnNUI6NUTwYWfn/umA+KTJ1nRKCOlvYG
	EBArNxTGeKsW9/n0lN2UASNO5KF57Qire58Uoy7ibuD6N6a5Ap7qWuqi2XaLo9cMoN2UqMuUyBP
	5LRhN7trAMRfn3ziCETST+NRM+JaJuWw7bbIrFja0tMIIkjTqdWLa6qyCK3Lq8u05NZ//GZKSpI
	zpD6fTSM0glijxssJB9MNbpqc7Qu/NIR5IeH8c8v/8yB+6bSAgNgwoIHxWyN7cURjJPK4
X-Google-Smtp-Source: AGHT+IEBOjDm49OG5iajjv5/g2Kv4L9dOcAdyp+LmUUVb1D/Ep2oTi+pZ65JkiAVimwgzoOcYQbOYw==
X-Received: by 2002:aa7:c6d5:0:b0:615:3a2a:e14e with SMTP id 4fb4d7f45d1cf-6153a2ae3a0mr2467948a12.0.1753691733390;
        Mon, 28 Jul 2025 01:35:33 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61500a5a014sm2968551a12.20.2025.07.28.01.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 01:35:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 28 Jul 2025 10:35:24 +0200
Subject: [PATCH] net: ipa: add IPA v5.1 and v5.5 to ipa_version_string()
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-ipa-5-1-5-5-version_string-v1-1-d7a5623d7ece@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAEs2h2gC/x2MSQqAMAwAvyI5G7CF4PIVEak2ai5VUhGh+Herh
 zkMDJMgsgpH6IoEypdE2UMWUxYwby6sjOKzg60sVbVtUA6HhCZDeLF+/RhPlbCiI6r93Ey+NQ7
 y4FBe5P7n/fA8L5RlE0NsAAAA
X-Change-ID: 20250728-ipa-5-1-5-5-version_string-a557dc8bd91a
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753691732; l=1189;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=uq+ImxcXIDpT7koBCX+UcC0xIpCmcUr0MukPByOa2Mk=;
 b=G2dTIgCPaZQDwhSQBS8d3RRhaJYTgThtBtF6HvSRKoozUXXxKyIRBsuhIuvD5vSc+6YhRgF8b
 69DChLOqCBiAHNo5Qr44J9qFsvTOU6dnTVrTZzCAhGRVB9PCbSuTTns
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Handle the case for v5.1 and v5.5 instead of returning "0.0".

Also reword the comment below since I don't see any evidence of such a
check happening, and - since 5.5 has been missing - can happen.

Fixes: 3aac8ec1c028 ("net: ipa: add some new IPA versions")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/net/ipa/ipa_sysfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ipa/ipa_sysfs.c b/drivers/net/ipa/ipa_sysfs.c
index a59bd215494c9b7cbdd1f000d9f23e100c18ee1e..a53e9e6f6cdf50103e94e496fd06b55636ba02f4 100644
--- a/drivers/net/ipa/ipa_sysfs.c
+++ b/drivers/net/ipa/ipa_sysfs.c
@@ -37,8 +37,12 @@ static const char *ipa_version_string(struct ipa *ipa)
 		return "4.11";
 	case IPA_VERSION_5_0:
 		return "5.0";
+	case IPA_VERSION_5_1:
+		return "5.1";
+	case IPA_VERSION_5_5:
+		return "5.5";
 	default:
-		return "0.0";	/* Won't happen (checked at probe time) */
+		return "0.0";	/* Should not happen */
 	}
 }
 

---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250728-ipa-5-1-5-5-version_string-a557dc8bd91a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

