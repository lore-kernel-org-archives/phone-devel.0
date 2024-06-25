Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F230716F0DC
	for <phone-devel@vger.kernel.org>; Tue, 25 Jun 2024 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327404; cv=none; b=cdvtM0fw31A8u1LqW481eCgRBh5ZDIGBvF6kai760KZ9fGz6yitZYkX5eCOPTHyqrgtli+ZCBwVAivcA861k0Q/CTygXt1s/D0YIqo9keKp35Rm5gKfrtG+dszKfTOfjw4vyrWnLBhYEW80gS9X1X5Fuvrvo/8fPeSV2gXvhdHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327404; c=relaxed/simple;
	bh=eHvPedc4wXf1HF6GzoGCS3vsxuSxT11yBWsZtE4uh+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T9vnCPm4d7ymCk9QGj7KgSA+NHvex3jdl5VXU22w+19AnvHT1L1riJ+v6TmlwV8W0KvkIWoAJGK33ej6CsriW3OJhdujh3qZ7Kkaorj0c2j/BFupLfpXKVOg4+wUbpyUtnFjruX06PIG3rT+WsPybSL+aEnxQ7HIgplCStJUi98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iA4XtQI2; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iA4XtQI2"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cc671f170so5651724e87.1
        for <phone-devel@vger.kernel.org>; Tue, 25 Jun 2024 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719327401; x=1719932201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uy311MtfEgGTpcpC73Q+KNbvwGn0qsgeTmIktNcXCxg=;
        b=iA4XtQI2IzCKZY0hV0ds1yACg/iyEP9mUXyyQafhyO37V6ZBpQmoDt1NJbadxs+4MZ
         auKUMckOdJw651JQgLe5lUdJZtgiJe9KpXiVLitOAXeGwjU2fwF+jEvyC5FqYcF9Jeok
         niu/jUKB/V+BRCRQzVMIRxA2rUrvd0AtCik5NIUgzjSyB5WFEbki3nlhcBPbDk4QS7/Z
         fKzgbe0+HeIbMcyEBqc2oot7htvcjW9f+yyww7YdDmjF8riZvYWtc0oHbnVuRTZKiRgg
         1Sfu5r4+DU7jFSA9pmt0nLM9Q1/gABxn9DG1K4/zqeQoOTKEY1hCGEI7Co11gAG/1OCX
         N9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327401; x=1719932201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uy311MtfEgGTpcpC73Q+KNbvwGn0qsgeTmIktNcXCxg=;
        b=KsnUEI4iBvRXLISaAsmw+BOK8vqq47Vna9xAHL44nICPTpPfbknAnkRqRaT9rNjJ+j
         jw7SDserhq3OGU4WVV0lW1xk23sxucbvFdZ7+pjOemuTTuEOinAH584Lw9a1+BqUswe+
         9V1HEFvv03jU/5wKvwLfpNx3Hf5U4FQ6SUbpw94XcBkCi4r6xW+d86oHGDL2hBwVgJUS
         PJHEsZu3r0xfKPVAnCb2A6X/H/M1m2GTPQgcH2s2meM+XlRrV2vHsCM12rYTMnfejwlS
         PqCeh/tbj6/FgsGInDx0BQXJbmGS8I3uoAQUXtvmjR8O3/9nl/NUD14VniGNqJLMTIZe
         tXPA==
X-Forwarded-Encrypted: i=1; AJvYcCV0/+ivdVUKWow5OJr0bIdQrn5rm8V53WAaVgn5E5to5BVxLPV+C+8msZllemz18LtDcLGrm3Y15ulpFN59L/8w+HKqjTr1VYHZJRM=
X-Gm-Message-State: AOJu0YznT+T+leoeQnz0G10YrHgQE0Xgxa/HHgVA1iXrz8rQT0usJnIG
	RBR5KoLxfvzjv6Tisq+iahxjIqeXRFdXhhlTi3+ZpwMn7b3Ds/eQXMTkE4OgdsY=
X-Google-Smtp-Source: AGHT+IGWSJ98xqTwdcAivnfx2Wmxx9wwkmjEWPIjZM3yst3js43OpqE9GybEuzYV29mv3KYo82eBaA==
X-Received: by 2002:a19:8c58:0:b0:52c:aec9:790a with SMTP id 2adb3069b0e04-52cfd46b51cmr128113e87.7.1719327401071;
        Tue, 25 Jun 2024 07:56:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd641f655sm1257321e87.162.2024.06.25.07.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:56:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Sireesh Kodali <sireeshkodali1@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/mdp5: Remove MDP_CAP_SRC_SPLIT from msm8x53_config
Date: Tue, 25 Jun 2024 17:56:38 +0300
Message-Id: <171932736813.1437673.16795984015504704928.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240624-msm8953-mdp-fix-v1-1-be4d3262ebe3@gmail.com>
References: <20240624-msm8953-mdp-fix-v1-1-be4d3262ebe3@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Jun 2024 00:26:01 +0200, Barnabás Czémán wrote:
> Remove MDP_CAP_SRC_SPLIT from msm8x53_config because
> it is not referenced in downstream.
> 
> 

Applied, thanks!

[1/1] drm/msm/mdp5: Remove MDP_CAP_SRC_SPLIT from msm8x53_config
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a3a6b350eb6c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
