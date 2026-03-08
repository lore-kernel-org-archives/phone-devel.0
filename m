Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438D034C14C
	for <phone-devel@vger.kernel.org>; Sun,  8 Mar 2026 21:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773004415; cv=none; b=FTX0fIGUNEV5YIvAI0RK+Z1FjqIGkqXoW6F9ik1Zj1wj1cJxLYjsswbkcWePILapNAk3zFfZ7jS6jMN29+pAPoRKjghYY5nplAWKsbhWMsJgAYv5dWzv//VJOymXjUl+LRBXpCZ+dcVoI3ww8wo4+5ia/TuzxHNbEZPvQIql5Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773004415; c=relaxed/simple;
	bh=IwQsRi65M4qXQUkCCxcuReQn++piLHkRFWLqIAUpTuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lDH5yMGcVuT4xIwlMWTnLNP4NJraE7W9KNDYe+J4fo3OZDy2kE/D74h+iwB1Ia4TwO4ScZed88nMnCW29x7cED5X7SpbgmhsLnEQK14xJv6vFNy0g3rtOugpTpSm+m1bgFnq/EWG1oaJhm5/gdlv+hUfu56u/PK8tmD5nx9id30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=cjBBVeqh; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="cjBBVeqh"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1773004401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RpqpYlSXeAg/awnB0CvRWHuxixfrf2T/O/CAPqniJDI=;
	b=cjBBVeqhU4T10lCpRAAeAjU4MCvwUt698hAAsE2RWi1Qx/9Tw0CE0dvcbuicEw1Q4mZD6z
	UorENWb2j7lE2N+avFntgIvEtixr2llBmLzs9WkkY5IJkDJdLwwQSL5N9K9j8qUtR+D8r+
	Sr7ntF2rhgPnKFD1iQ28UW29ErlFzNp6GL1vocdSJR7RUUv/iyaCRj5ZGPuvsb1uf93JOB
	ZRdEbhl5sJeeqrPuhIK5VsQX9N8t/Cwn0521TR7Eo3yxF/hS4VqrOX9gK1KJcbRu3u/rNf
	6eCwLm7iciBqtV0YwVsdCO4zTNByzkNLsiQAWsRfSrX1T+18o2V/n4dDJ44sNQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 08 Mar 2026 14:12:54 -0700
Subject: [PATCH] drm: msm: adreno: attempt to recover from ringbuffer drain
 timeout
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-adreno-ringbuffer-drain-timeout-recovery-v1-1-985a33faf108@postmarketos.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQ6CMBBG4auQWTtJC0lBr2Jc1PYvzsLWTIFoC
 He3Yflt3tupQgWVbt1Oik2qlNxgLx2Fl88zWGIz9aZ3ZjAT+6jIhVXy/FxTgnJUL5kXeaOsCyt
 C2aA/dnaEd9fJDilQy30USb7n6v44jj8C+n3LegAAAA==
X-Change-ID: 20260308-adreno-ringbuffer-drain-timeout-recovery-617ea69813fc
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773004397; l=2696;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=IwQsRi65M4qXQUkCCxcuReQn++piLHkRFWLqIAUpTuE=;
 b=eGLN4VQHSoWAmzLT9wCgcSJt1HexLpTsXFY/zSncDP/EA8z4I5dzj0yYnNm92JPgaE46Hkccy
 VOeuuDdDFAiC5lPjHB0M+Wg6skuqLqSpRRvniitEFDaE+chlBosgLtp
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

I found a 13-year-old TODO while debugging gpu stalls on sdm6xx/a5xx
and thought I might as well try to implement it. It doesn't fully
resolve all stalls in the driver, but it's a start.

[drm:adreno_idle [msm]] *ERROR* 5.0.9.0: timeout waiting to drain ringbuffer 0 rptr/wptr = 32C/C
msm_dpu c901000.display-controller: CP | opcode error | possible opcode=0x00000000
msm_dpu c901000.display-controller: [drm:a5xx_irq [msm]] *ERROR* gpu fault ring 0 fence 29 status 800001C1 rb 0380/000c ib1 0000000001898000/0000 ib2 000000000366D000/0000
[drm:adreno_idle [msm]] *ERROR* 5.0.9.0: timeout waiting to drain ringbuffer 0 rptr/wptr = 32C/C
msm_dpu c901000.display-controller: [drm:a5xx_irq [msm]] *ERROR* gpu fault ring 0 fence 29 status 800001C1 rb 000c/000c ib1 0000000001898000/0000 ib2 000000000366D000/0000
[drm:adreno_idle [msm]] *ERROR* 5.0.9.0: timeout waiting to drain ringbuffer 0 rptr/wptr = 32C/C
msm_dpu c901000.display-controller: [drm:a5xx_irq [msm]] *ERROR* gpu fault ring 0 fence 29 status 800001C1 rb 0051/000c ib1 0000000001898000/0000 ib2 000000000366D000/0000
[drm:adreno_idle [msm]] *ERROR* 5.0.9.0: timeout waiting to drain ringbuffer 0 rptr/wptr = 32C/C
msm_dpu c901000.display-controller: [drm:recover_worker [msm]] *ERROR* 5.0.9.0: hangcheck recover!
msm_dpu c901000.display-controller: [drm:a5xx_irq [msm]] *ERROR* gpu fault ring 0 fence 29 status 800001C1 rb 000c/000c ib1 0000000001898000/0000 ib2 000000000366D000/0000
msm_dpu c901000.display-controller: [drm:recover_worker [msm]] *ERROR* 5.0.9.0: offending task: sway (sway -c /home/user/.config/sxmo/sway)
watchdog: CPU1: Watchdog detected hard LOCKUP on cpu 2

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d5fe6f6f0dec..77cda368eba1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -742,10 +742,11 @@ bool adreno_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	if (!spin_until(get_rptr(adreno_gpu, ring) == wptr))
 		return true;
 
-	/* TODO maybe we need to reset GPU here to recover from hang? */
 	DRM_ERROR("%s: timeout waiting to drain ringbuffer %d rptr/wptr = %X/%X\n",
 		gpu->name, ring->id, get_rptr(adreno_gpu, ring), wptr);
 
+	adreno_gpu->funcs->base.recover(gpu);
+
 	return false;
 }
 

---
base-commit: 52584178a10aa82d80aadda690f4bbc76d92ddda
change-id: 20260308-adreno-ringbuffer-drain-timeout-recovery-617ea69813fc

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

