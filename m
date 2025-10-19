Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A1B2EBDD3
	for <phone-devel@vger.kernel.org>; Sun, 19 Oct 2025 16:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760890568; cv=none; b=J6v8xdgx3T4KjDiobnIiB8k7JrLMB5g3iTHU3AU1wUYLTX0dysYmFIcHA4bEz4L+lrf9OadzkL33kMPSQw4mCS+Tifx4m2QniXWVmPWs55CHdRqtsrYuZr3m1kamaN/hlgvdAKdtFmXu2KuGFsLSCWxIj9HAtZ4bFOrgC2B2txU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760890568; c=relaxed/simple;
	bh=w65OdgmpV8I1cxj2sfq4rK12q9mD/l6u6jCluPLlwTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMFd+3HvYrpEYgQr1FdsdXXsZ7rL9rl5UfA6aP1h2KWT8CI+rJToFcDxwvquntesunmfJoOwKCkPsOjpaGyMSIMbh7PIx818jkGpwup9BedBfuJfgKc6ljk0BlEygTTtYnnCw3pelDpA5zk4zNJ+HOZjr22OdQBuDmKFGXqJQcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGjOPPP3; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGjOPPP3"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-63e0fa0571fso3313078d50.3
        for <phone-devel@vger.kernel.org>; Sun, 19 Oct 2025 09:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760890566; x=1761495366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w65OdgmpV8I1cxj2sfq4rK12q9mD/l6u6jCluPLlwTY=;
        b=kGjOPPP3AV4B15oNWUCh7zjCvw1lMZxc8GWcUcYppse9Tmq0p9m5dEEqeOh4hDgt+6
         /U8YQXEAb+Oh4B3Iwycd2esArczN3zTEW8zGLdmFUdIiFHxQnfm6mFIk/rsnQaSRxm9V
         XyKIBb1EpGzuMX0m+VYww5SehqGqwf2L1zToNiBNNp0IMY+YJALiPgoSRjiXVsgiIRQ4
         5V+LdS1AupKh1LVlChSCR/RN+xxWQpiVAwfAnJ8LbaknNmuf0jGfp1sxSqTKpKzll3MI
         HQutE1Wcnaa2JEdO64lPH3Q/e4F3UMhL1wq0cou3TetKULGj0YaMuGNahwZJwTEmXHS/
         EyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760890566; x=1761495366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w65OdgmpV8I1cxj2sfq4rK12q9mD/l6u6jCluPLlwTY=;
        b=jpyqit9gqC1QkMsF2J940y7j3MuqkC7mIcdLIc3WSQHUa/HkxqU6b9iSqEuFjOhZnJ
         Civzklnftd3JHiLZ4mnSl705o9HRsrXC5ortc3UkFwnYhkSHDiWvYltewtvdB5rl7v/T
         NqrhKwIRWcYfO729rdM7PydvEcodyaiwhmQnVcCZ14OcnSfv32OjG1uKltFiB1Lr9nIH
         Um+R9osF8hv9Cx+mO5z1B1/vKfZjTyAOwvYRGNizrvX836p34bbjRJYiUUD8dbnKoQGH
         dfqmqrTWE3lLQ+v71ruXAzqWJ0ZNAMhN6HpbpqFnixUIesNhEJvT9Mav1qkrtjEVvhoU
         a1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUcu2lYV6cCv6K5zqqIAj5OmLGO/etzyqfYuznbzZ8eJ9WfUX7ZibRptQAoEpcBamyB0Hci+dTyLk0A3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsfvM44ZC0e6FJOwUMKlhkCUFe/7ZE1xK8tHngdz6asLANv5eC
	0NzKSaOgj+MrQcvOHEXV3peg5D2XXgaTnc8FnQ6pDZGL4dB9PAbT5YdF
X-Gm-Gg: ASbGncuironui9reTnhzJLA9LMkIAzISFQU4tunwZxgzTThrbXNc6TsuKzXHxrf2jgI
	sW8ad7QS+sMybGILQHy8ijhmR4lNvZQZT4YjRsMl94x/P+oVM1pYZg9C4Rqqh9fhCd6PCjOXp0X
	Y1vdDoyVpwe82vM49BFDgvuuE/DZw+xPlRl53UXHV9q7pAHmFa+/iDMkrsis4xdQy7A8ioIh/8C
	gFdRGUGGp2uv2KgomkfTawbKOS4qrYNNeyW0x61IstZBcw75yYdEKpcZt9XI6TMA4TJzz1jQk5x
	jh4AN9m9qdr0ZeNcnlaAekexqq/XejWFoX0CKWgeOF+cd83DlySwFkHD61Y31K7h4JQ0RFqF83x
	POODb2sPTykf8PYDTDsd68cV6e8/3lVB3SN3VNkKpvxr/SkTh+kX6NjWh5b7H2fptAT2FmoZhvY
	+MF11yYCjHUoPHrdhC8+a6ZjvuMftr4rj9J6t8hzdQVgWc3dOVzrVXvuf3bUA=
X-Google-Smtp-Source: AGHT+IElWfzAepNqK3LlpQymTFB+dnzq6dId0s4n8cc9tbggmQJHdM08XYTf6C3f7CI5MrGaIVI7tg==
X-Received: by 2002:a05:690e:168c:b0:63c:f5a6:f30f with SMTP id 956f58d0204a3-63e1626157bmr8254979d50.57.1760890566174;
        Sun, 19 Oct 2025 09:16:06 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-63e266bc09csm1738354d50.11.2025.10.19.09.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 09:16:05 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: devnull+federico.izzo.pro@kernel.org
Cc: abhinav.kumar@linux.dev,
	agx@sigxcpu.org,
	airlied@gmail.com,
	david@ixit.cz,
	dri-devel@lists.freedesktop.org,
	federico@izzo.pro,
	freedreno@lists.freedesktop.org,
	jesszhan0024@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lumag@kernel.org,
	marijn.suijten@somainline.org,
	nicola@corna.info,
	phone-devel@vger.kernel.org,
	robin.clark@oss.qualcomm.com,
	sean@poorly.run,
	simona@ffwll.ch,
	~postmarketos/upstreaming@lists.sr.ht,
	Steev Klimaszewski <threeway@gmail.com>
Subject: Re: [PATCH v3] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property
Date: Sun, 19 Oct 2025 11:15:59 -0500
Message-ID: <20251019161559.6731-1-threeway@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
References: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Federico,

With this patch applied this also works on the Thinkpad X13s (SC8280XP), thank
you for this, I know a lot of end users have been asking about this for quite a
long time, so nice to see that we might finally get it.

Tested-by: Steev Klimaszewski <threeway@gmail.com>

-- steev
