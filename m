Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D246A33B
	for <phone-devel@vger.kernel.org>; Wed,  7 Jan 2026 04:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760087; cv=none; b=qwwqCYUtGc04sUi4B7VowOJJ3xoeWu8rwspdgKTLq5AqgXzJo8+Nm0i2oJ73th3z8yLLcUymgkpcWhEhibQPpp7uzgvWaBaukWWMHJ55ILcw23XZd5cm/90rlivg/tOrZqNbFznHixmKR/KcXTt6lX4x7Ss3AiLmRvh8OzirqBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760087; c=relaxed/simple;
	bh=NzR3V+hWLebEkE3+SsGGOtJ3Aw3p/n8XHCAiexT6GGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGeMN7aytvOuIXzyxMHQVgfAHWdcNIlk2Zwe4WNickKIeyVhsJD/iqJyroTroHHYSwnsg0MoEhsY6jk0fcGh8trEncRSOh695BoA7euBeaPXRAiq03/npsPFwzA2e8ica5OQYKUy/bFd0W7Z/c6PeCxxgzoH3XxcDizP3DeDDOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyLJ+Civ; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyLJ+Civ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4f1aecac2c9so6126281cf.1
        for <phone-devel@vger.kernel.org>; Tue, 06 Jan 2026 20:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760083; x=1768364883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NzR3V+hWLebEkE3+SsGGOtJ3Aw3p/n8XHCAiexT6GGM=;
        b=KyLJ+CivbXZtxvCp8TF/x8Sev5yuK/HFr9tUIpwDrj7CKceBHqz4UD1skJzvjzBKRA
         7KeoTys6IH9TyhDXY1nz2JnggQuzNo9T4pAuRTsdFdyA7gH4dsP79Du5DNhM6LlWjNfr
         3yAjPMvVtlGWFCaCIAr5E5b4lN3/x5br9HusnNiQ6l1Mr6ljc39/ABNKWPOyaItuXAjU
         Xqv4fQruvD0cQX4PSGabVvwEq/azJfXiQhguv/wkZoS3Q+8EYnM6liAC3DD+xdeSEtDw
         ibsOy+3qTg62AErYoWV5GWSfo3LQZ3WEK1bkuvI5MJrK8K6ScmCCTEMZREpNylk4TUY8
         NZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760083; x=1768364883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzR3V+hWLebEkE3+SsGGOtJ3Aw3p/n8XHCAiexT6GGM=;
        b=k0jhNrgGWxdJZIwXMKLmU1dK5c3xkN1pQL6u7PMfv84L9aPjL57n93kdxqSygQwDoI
         Qz6jhqf0XG2dfdiXTEqW39U0YgNEMPRMcrDEl4yv+corhmGFkgnw3yIJC8TnxA+9ibOD
         4+ZMllfQc6yJfuZslnXfxpJbpCgEXzpdDgYrZXetKjf9EVqWxyIr9n+w1J1GwCMdXzFg
         uIOneznX56xzLhgpqdW8umA8tmOB5jmb0t4mDs4sarrpKVvLow8+xV8rq+cmiOea5IZm
         13m6jAEAUJYE+7va8UwR1Vh4M9x1unhGbwdUkOvfF/lKBxiYF2TVHqgIo++auZcC7OtT
         vT0g==
X-Forwarded-Encrypted: i=1; AJvYcCUIwM9mBSzNWF19A62K6z+1o5wTUvH8wJwGAjVwnqsEvyR2llSCQqT3zqMxyinTJCnlMnVM5Y5pVodtwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEwwuy64iKtR48xeyMOF1J68Z4NptMrI30tNsOzMukPtzathrI
	xWitqfiYJ4icCS7beXyaixXHbmB40CYRh8KCQuIoI/+rH1AP2PTh8x7L
X-Gm-Gg: AY/fxX6rU7/BRIMTK0hKrTQPcZGcqgJ//GK1Dna9ZRcTfnX8y9FCMorfhT6iDQ6w0Eg
	JpwiUDl+gtLWO1TWf153ugexZupngwwB4kXV6gfwO/wz1exjqGQLVpIrelFxIBQZv0N63ZAv5Hf
	ZS16ephk5WYDhl0Na6yEhUfzo+xmsK4Q7okltsWiz29zVEyiNF0KLUjheToHr+aia82xTQO6IpV
	OitqOfFuI1ZFMEyT223eBlhZ3EJO+NCijElc3TjbmVhHz4x1TEqApg7J4PNv/MSw4tY+fAM/Fvq
	mOAmbfXSnVAmR/VWVn0aFAO9tmhd20EzOWNLQoxI7jTc+stXM5sCvdYrE8DKFCOMu6zOj4df8Js
	Gvl9RLrENr9B2WyyFfkGD0+JpuUONMR1CnO+N405b21au6p+hHxrmCaDbg64PYl/kZBnSElTcZ+
	Gm3SHRgyQwu0n7CQ==
X-Google-Smtp-Source: AGHT+IHnQfsj1iawjyhOVxIptrkGxNIYYfdvLPM+KbPfYJZ1Sz8qmIQNy0qNULXQA+Vaduz8APOYjw==
X-Received: by 2002:ac8:5984:0:b0:4ee:17d8:b583 with SMTP id d75a77b69052e-4ffa84d51bbmr67296861cf.27.1767760083612;
        Tue, 06 Jan 2026 20:28:03 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce985sm26075736d6.11.2026.01.06.20.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:28:03 -0800 (PST)
Date: Tue, 6 Jan 2026 23:28:24 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] media: i2c: IMX355 for the Pixel 3a
Message-ID: <aV3g6NT2JiLX6ELd@rdacayan>
References: <20260107042451.92048-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107042451.92048-1-mailingradian@gmail.com>

On Tue, Jan 06, 2026 at 11:24:46PM -0500, Richard Acayan wrote:
> This adds support for the IMX355 in devicetree and adds support for the
> Pixel 3a front camera.

Oops, I need to resend this. This version is empty with no real patches.
