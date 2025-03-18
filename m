Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF91F4CBE
	for <phone-devel@vger.kernel.org>; Tue, 18 Mar 2025 20:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742331059; cv=none; b=b06MLYR2FW+PDv7NAqmaaTTY6e7alEiixa1E/y4mjFUX5CAVxqUI1pC1FPHQ1Ndj6dmsYepU1dn+swRJDWAWw2Oc+rrL30nPO09LvuVreLb7YHS4r5VS6/Qjkjb85NkzDMp8ePKabntcnIRJ4lGldKhOgZN6bbqzut4vvuzg1JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742331059; c=relaxed/simple;
	bh=xDd5pymcW0i1Wd8xe3YzO/vkoXoHglAxgaQ/uxX/1Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZY7QZS7C+kdgH9QAAQcEcbSWAY6ndrFGoGD4Cd4DrYTArNngQ7l6P58Yhh7OJKS15GS7UY6mqcbkrWqET3vAGzy2mYv/HWl+XQl63cvqsECpv1+Ole0Aj2Ex0RGxlzfS0qmEb2cOf+80u3SevQaNdypXLSCfFYMM1q+m2dtc1zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DzXR9YcF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DzXR9YcF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfe574976so24557535e9.1
        for <phone-devel@vger.kernel.org>; Tue, 18 Mar 2025 13:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742331056; x=1742935856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3UohDItqJbHSrPJP72i3dlPHwcSi2GhbxMj73jX1M+o=;
        b=DzXR9YcF9jDmDiSRjebMBqNTc9Xr4qGrqF5CYRW1n39NGtk5k6pl/QY3jgEeg5WD4G
         b9TOVIPM6yD/nNAOepDwlmfsehP6R1tA6/HlX797tTNmUvgC/H3WNFR2RDARc6KrsERo
         II8SbketJEAPX4LW26on7dAUSKE3N+vH0ZEtv0ewbk+Qyu7B6J5k9imUqoRsYAmTWql2
         dXcrZta8lY6/z1ucY3Uhb4E/ukieXbgqR3MmK0LmFcZN7Am7Em0CRlopc6CyMDf7W83U
         DTedvMybYy+hmpnaNaFODno6X6C371jyXxJ6EnsO97K+W2NrX6D9hPWbyAvLnxfZE+sD
         HRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742331056; x=1742935856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3UohDItqJbHSrPJP72i3dlPHwcSi2GhbxMj73jX1M+o=;
        b=Ypcjyz40vsS/azKpgTcxgZ3E41TNVD1NU73aqVEK9UgtQ9jYu1t5UqNb1XaP2A0mtA
         mAaS796xWNcRN7rRy3vhdCSLdUu9I4GyQdJFOWjxjKTBoy72Oo9q+LnLo34gkOjSkEj8
         3FsRyaW+IRgxgy0uhOqtympJsRVwOTgMGZD1o92A6+9hZDnYGPhlFSCDOLb8Q/UxU+Xl
         2w3MgWkyLCGz9RCAqJEIj02EY7LSNGHmTvLVn231lwHZB0UbP5ZerBiPL0LdAE6CQJfm
         aMItMebsUQ5rPwQZkl9We0RUUATv5JBBW/ViGhLdun0SkbSij5AtZyFx4Iq0W4JJyylY
         tayQ==
X-Gm-Message-State: AOJu0Yy9HZMosme2iiCICLDu7uy/xqeimbVBXCKEyEaTCVW/tYv1vZBt
	jG+AtNVrt/Aq42jHUGLoJw8Z/z+YoW2ikLpIjs/7mpMYdfiHK2TdkGi4C0fzjlvFUCMvRux3kQl
	jwIk=
X-Gm-Gg: ASbGncu5gf0DNa9wryong3AFlq132DEWg9Ae/n0C8UCsl7nX8ih44J110KgnJ6WeLQu
	pBq/mY1o17ElhudeINFGaRJzFabRlTwQA/9Yu9G9LinhjzPUKIWx0xhp2+Ebprmax0oFertExP/
	jmhkizeCX3fO79QGQONGFUEXxQOzHjWJhEyK5WobjQSWxHRoFqJR5rpVtXaQudJ4ZUgfoQfq+I6
	6xPFXNHmEd/PFJAQLHKCZ42Ad5/scLq0B5pe35ShLtqRmIMZGCf2AYKQxV4TEFHrxyicDbpmlaD
	ChtpRxNHxD6/lAlEYG+foBdmCk2D8vhNOf6gWC5yBlwI1DRSFCO0qIvRQwg=
X-Google-Smtp-Source: AGHT+IEMGi6XLwyG661+0/YviXfVdYcrgXqlOdZMjARlupJXDIehoNdeJwTWQOa9f4YxNoViNwD+pQ==
X-Received: by 2002:a05:6000:1785:b0:391:c78:8895 with SMTP id ffacd0b85a97d-39973b32028mr143871f8f.50.1742331055842;
        Tue, 18 Mar 2025 13:50:55 -0700 (PDT)
Received: from toyger.powerhub ([2a0a:ef40:1d11:ab01:97b:e453:3907:27d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe05e8dsm143198645e9.9.2025.03.18.13.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 13:50:55 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kalle Valo <kvalo@kernel.org>,
	Rakesh Pillai <quic_pillair@quicinc.com>,
	Surabhi Vishnoi <quic_svishnoi@quicinc.com>
Cc: phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Caleb Connolly <caleb.connolly@linaro.org>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH] ath10k: snoc: fix unbalanced IRQ enable in crash recovery
Date: Tue, 18 Mar 2025 20:50:27 +0000
Message-ID: <20250318205043.1043148-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ath10k_snoc_hif_stop() we skip disabling the IRQs in the crash
recovery flow, but we still unconditionally call enable again in
ath10k_snoc_hif_start().

We can't check the ATH10K_FLAG_CRASH_FLUSH bit since it is cleared
before hif_start() is called, so instead check the
ATH10K_SNOC_FLAG_RECOVERY flag and skip enabling the IRQs during crash
recovery.

This fixes unbalanced IRQ enable splats that happen after recovering from
a crash.

Fixes: 0e622f67e041 ("ath10k: add support for WCN3990 firmware crash recovery")
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index de96c3939ea6..01e26f259fdf 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -936,9 +936,11 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
 	bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
 
 	dev_set_threaded(ar->napi_dev, true);
 	ath10k_core_napi_enable(ar);
-	ath10k_snoc_irq_enable(ar);
+	/* IRQs are left enabled when we restart due to a firmware crash */
+	if (!test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
+		ath10k_snoc_irq_enable(ar);
 	ath10k_snoc_rx_post(ar);
 
 	clear_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags);
 
-- 
2.48.1

