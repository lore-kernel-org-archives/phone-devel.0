Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CC031282E
	for <phone-devel@vger.kernel.org>; Wed, 18 Feb 2026 13:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421547; cv=none; b=abXWBxOsd3VF7O/EQDr/EpFifkgzQfK/t3eFt/rKCT8HFmNxj1pt/YVk/u+OlUGPhLsEgTUbib4wDCkNrfszpYq6O4Srcz14pwQwC105YfFeX+A1S+UmRCu/npQms2rpG8sRuMfq7g276JYIWA3uB5niZ/VTjNCF4q8hFOZh8Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421547; c=relaxed/simple;
	bh=OjsOVKKkecxrDuJK35sJC8GLlFfWYkzW0WWUdrjxNms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V77KIq6u6kRAkX+xdumGlrD1ItDu5LbB4Wtsq91sCnevTbOxYL3y7SxaIYr8A9C7ae+DQDFss3xqkjcPOj56H/xXqeXAgdsaIZjIq5111wf5ctMnszxRbELJd7eaNGFfK22hEaUvKRR3DTjca+ttplGN8vRJurhOp4pMlCmrdAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1rqW9D1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1rqW9D1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48371119eacso50461435e9.2
        for <phone-devel@vger.kernel.org>; Wed, 18 Feb 2026 05:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771421544; x=1772026344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03+WHqXS0uXZVxR2wEZ9W9ki9OCzcDYn5L0WMe95atw=;
        b=Y1rqW9D1496cF5ypCs7cp/iINy4GKv063cXMo7vkTbIAxOKlOuM7kLztJEFpzxazGR
         Ik2YQ4panmveG4YoS/qy65PscJsNNtucDv++mwhaWYYHiJMFSE+oXtY/jCzuWn16SuWe
         UFH2Mk+71wMJFctN5W3/z82GrC9cTtw1f9D4mXDQnF38v4CqnWl6AVIAGgdZ0F7+xIR4
         yrpoWTwIJTnTlVpd+PHBQYoXslzql2slqk+KiRW3BpdEV2bEwsRFUwkwDD51mOdm33AZ
         ya9lDC5RBLYw5EWlTkgL+znGRvZvIsv7KPgy9DmZcwGHTF1OnMy8Yn/HOOhAG0Hb3YxS
         8/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771421544; x=1772026344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03+WHqXS0uXZVxR2wEZ9W9ki9OCzcDYn5L0WMe95atw=;
        b=dqDt4edox9u3oHZikwfEcN/Khvr7pDjAR3MtixLnJmnr//ZjzbfPqfDof8/5h9rZVi
         C+B2aHL2rbgUD/uT7/8YrGJZYPrqxp2BgkamGH5FjVTw/Sfv77rtz5MY2UoltXyNTr7s
         QMJsxkNEK5QWhm42h/C1hc7xyDstFQKEEQnuN48jxmmEakJpwstkDiwDXBlQjf75EakF
         YGcFEU66NvsvLecQbxoS15ffxH5AiA7ozKj8+o4sHVZ6HjXQ4/HttF4CNgkzlnsyBYoP
         /j8w4BCtWgf9uEss0T0EG0AL979ttHjz8H81l8wxsv+y03zMLHFLlkAjXhQ2naOPwOGj
         aWLw==
X-Forwarded-Encrypted: i=1; AJvYcCWVUxWx5JS2CPi+mOr5sqjPekKQaKolQht26QVGQ1zsBInM9S2SG+4rZ2NW3/RixsSZaS2O/PKyomc6ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMlB6m/OBf5j8WRhrZfUmZ3oBkfEBv+7i4LqC7Z+MQb/5G4/N7
	xqSZGGy1nknB3rdCEER3NMVZwtn0SXoBvJEwEG+ZeL2rifzD5GkOzSlG
X-Gm-Gg: AZuq6aL7AGgRHpvFcN8T2Ove/7CmBWT9OQ9x6KrEM/f8RmjwdkcEIlET8vP711tLiml
	6VCljOgZdKfL/ISy34SoYZ9jnU/YagKZDX5q0oFxbcfPyzbWf9PgfMD/9xSB5gtnc44xXO2yv74
	i/cQ6wACk0DO1SQk4Xj4S2TvsTAiix1UUCe8U1j7RutofHcuOyB5lpVLk9h6WKGkIK+npAv3jWG
	naKvpo5Fo3cLmU2BdwmtuD2sU/9v6Q7tx9y1TBXu+3BLWV81Kz90MUVFAx3zqWvmdTBkcEdYycC
	8heYsyqmrHTf+MK3b+NE1KmVRsf20WA91NaizJqtmmGnThf5Qj30hnTIz3ou90u/0GESQST4hKt
	fooLuwsDIykbOrrkcUF0oTZY24Rqdk2detuQnCKzaW29Q3cOR9HAhQK/Ho7/wTM66YXX622fraW
	Lx2cqDuGkafIJQYf2Bj27OHTOxRrd9A6Jo0rnvF1UN8GVNkUZj
X-Received: by 2002:a05:600c:c4a5:b0:480:699c:abe9 with SMTP id 5b1f17b1804b1-48398b879c4mr30727945e9.37.1771421544245;
        Wed, 18 Feb 2026 05:32:24 -0800 (PST)
Received: from fedora (89-139-55-36.bb.netvision.net.il. [89.139.55.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74918sm41939520f8f.17.2026.02.18.05.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 05:32:23 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
To: val@packett.cool
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lumag@kernel.org,
	marijn.suijten@somainline.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Yedaya Katsman <yedaya.ka@gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm6125: Add missing MDSS core reset
Date: Wed, 18 Feb 2026 15:31:18 +0200
Message-ID: <20260218133117.1584696-2-yedaya.ka@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216233600.13098-8-val@packett.cool>
References: <20260216233600.13098-8-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 16 Feb 2026 20:25:24 -0300, Val Packett wrote:
> To make sure the display subsystem starts in a predictable state, we
> need to reset it. On closely related SoC (sm6115) this has caused
> DSI displays to not work.
> 
> Wire up the reset to fix.
> 
> Fixes: 0865d23a0226 ("arm64: dts: qcom: sm6125: Add display hardware nodes")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
Tested-By: Yedaya Katsman <yedaya.ka@gmail.com>

This makes a panel driver I'm testing work more reliably, right after boot
instead of some random time later.

Regards, Yedaya
