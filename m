Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA34399350
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722418; cv=none; b=qqMJc2XO2lB+n2X18A1L2YZTZ44rJm4KL9/1JeF0xa4GuHWAR2+/exsQ2jow2IxsorW/SdFSe1/F2gye+U0WSuF7ExV61XrIgbHDvxb4DER3TARmVo6DyhN8kqpZDKlf/HveKA6/6BNmVE7Jvp2mj7OCOOWbqoNQ/m3Rjtxg2fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722418; c=relaxed/simple;
	bh=mWGhox8AXmFUrLnRncYPHqWj29USHg6AI1ZxcWStxYs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xdc5vusahelA3M3ciNeV0PGxLYDjNCRBnjXf8CZzzRpDS9t7izYTtLHbSgDTtTuRyXppocc99B+0sKyhojj9kGW/Op1R7BSn+cZy3PURDfiCYo2Q8ZFsg6dODme7XV0fFk3lauFhOFnG5Vy2Jom2d9XRl8z667hdyBGsAXrFtu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GnWv8TQU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GnWv8TQU"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9b1ffbb9f5so81683766b.2
        for <phone-devel@vger.kernel.org>; Thu, 09 Apr 2026 01:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775722415; x=1776327215; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DlWAuV2ZEOJrkIZUEM7lgz/oKWXmhKq/PUKh/pIHm3w=;
        b=GnWv8TQU7/gIwZyW7PIk+S5+yXyYWsP0IJ4NqmoTNLlTqXFqJqBByNsjUgaxqmawZ9
         jXbRsD2qI+bseqpRd9tHzN6VO76B37m3gsv3vEfTWlYVVR8CugYErWIHgDx7rGTIfHDh
         J8xJYnJm+Wig6aRirEWtkJNWmq8xVkjWkyMmEGM7Frjr3emQm6Bhdf7SJV4Q601rkZVH
         q3/hZemxwOn24CsckDf12o++46fb4WDSiebFjfzzETtFTQUhH2nNZBVVPjeRJUfzqNco
         XkMxNfGGd13W/7qYc11gSOXZBsVa/0pMF7jF64VJM+kk2IogqCD9gpiXXlgCBArpWe2N
         p+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722415; x=1776327215;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlWAuV2ZEOJrkIZUEM7lgz/oKWXmhKq/PUKh/pIHm3w=;
        b=piLD5ynpGmQq+x+CAo53QQDej5hwCR9xAwrye/Wy6iGm/ddYjwEYR3UsNYr9bk3xiN
         cSaSIhXmtAJen7/RJTI5B+FgfRj5mrJ39NCc7ZN4wddvBBAd8fUtxKzjyqjK8YyEW2n1
         Jv7iDEdfbmvTxMfwYJ6doPcf+o/KbjGchgkjYBSv86VS9HpQFhqkHiyR6KUs56FsqLRa
         BeupzhCWblK+HNU9XUITpVzlc9YweVEIf9KfEQ179xQXtf3qWNZIJjlstbMGUmQaAjAs
         C4brZvkt6SOUWJxX2QGnmHBsyS+YhYSxR6L6Vj3STP0TEC/nxa2Y//gfRJyUttLqUQr1
         4DUA==
X-Forwarded-Encrypted: i=1; AJvYcCXHmEMAFpuSbKuorIjFIRaFW3w0PJbIm8XXP/ux5MMaFDYEC6y0koSKsQuSpbCM8EgTPYnSFyQHJB8foA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHWT1kWyOBFK48BC/kZBb77g075Pgxi3nNJXtE/A+mhE3nm292
	q+uulMLuRuzsaVoOMmkTjPij/SxxxSyG9VdGTTmgTiptaJJRrDcmbOD1Km3FKZu1PWY=
X-Gm-Gg: AeBDievBCZ/olhJPUlkpla8U1ATvM4SQQ85X8tcVVySQkvRed/Z531hlOwen7QoqcUi
	TBS2j8CkaorDHiCYk0lIhxCmx6dEc/5SMYwpOWoj/Ae395edUzVgJ5vPCbPVFgYFBy7VHKO+odx
	DWktwtwcRr+2EiBC5wevtmn4I9JT582/mtQSWPGECJopCm2MseEOKU6NnsguR2K3h8+mbCP2IGP
	QUKTr9NII4LzGdNckiuhQdG0XFCsQCTNJBoFbREA+YHOCedT6/ycjzKz/w+8+W8DveFTJdLYxNc
	W+ds+y+Fst6T7H5GKnjgNK8QUTyebVQAqhBlkEjcByHQED8GjPJ80K04gAz/4/2R5Asz/ArqADI
	pFlwICgDOYLhhRjkpsMuuKnjWb7i5+5f8moBtoPy3IQYGltQDtFLBUXiNdqFmjBHegq8ijMtk7C
	NzOvfdYaTbVW9aik+g/apE/kqkulSsBmN4tgL3bPuersKkr26JynVzioWyav9OZtxk5ZVP98+o2
	MHVEw==
X-Received: by 2002:a17:907:d87:b0:b9c:9594:e10 with SMTP id a640c23a62f3a-b9c9594137dmr967380166b.14.1775722414580;
        Thu, 09 Apr 2026 01:13:34 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6f20sm709846066b.38.2026.04.09.01.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:13:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH net 0/2] More fixes for the IPA driver
Date: Thu, 09 Apr 2026 10:13:30 +0200
Message-Id: <20260409-ipa-fixes-v1-0-a817c30678ac@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NzQrDIBCEXyXsucJqoiZ5lZKD0bW1kJ+qKYWQd
 69tcxmYmY+ZHRLFQAn6aodIr5DCMhfDLxXYu5lvxIIrHgQKhQ12LKyG+fCmxIzU0nrRcnQeCr9
 G+hUFv8JMGYZ/mLbxQTZ/V04s0nMrT/lkR5OI2WWaQu4rqRB1p4XFkZNua2s0b5zy3BclpUjW3
 AnuYTiODzyDOqG+AAAA
X-Change-ID: 20260409-ipa-fixes-a575cf2810df
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775722413; l=527;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=mWGhox8AXmFUrLnRncYPHqWj29USHg6AI1ZxcWStxYs=;
 b=J2MpnoPY2PqhNg69JarwyHsbeXDvK8bDP7eNCK1kWpKXkeM6qykXpwNkNLR8+vhXqkqhe+oGT
 Y9C2inv8v6JBb/SwphLOhGMoRJF09Rhozdbaa+530VucN3kK+yyRqQP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Two more fixes for the Qualcomm IPA driver.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      net: ipa: Fix programming of QTIME_TIMESTAMP_CFG
      net: ipa: Fix decoding EV_PER_EE for IPA v5.0+

 drivers/net/ipa/gsi.c      | 1 +
 drivers/net/ipa/ipa_main.c | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 56007972c0b1e783ca714d6f1f4d6e66e531d21f
change-id: 20260409-ipa-fixes-a575cf2810df

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

