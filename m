Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B5613D503
	for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 14:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765375614; cv=none; b=H439xeL3tP+sCTZx9OzM3MmcwglCQMUyv3dS4lGbrLrxk4SQcHNWF2nrsl06Ln05E7zVh5qvpGKcsrl4g4Rm6ch2rDCCZVMgas/IrqdhtfA1SOK3/Y2UnsyUEXxyyiY22rvSPK3uORDrbM5Sziq0sbR7lg/RelvXuoFX0Va8dyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765375614; c=relaxed/simple;
	bh=9e/kA6oIOyhPzKZ7ArQO0A4zv907CzD/WHILb6v+0H4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=fkHwbGMv1K91gomLdPLwbn4PJ2z8pC1UHqcJJD/GWJNVIxmfITXnU3SjJrqq4IQrYVf3irmX2ckV35ThXbLBDEj3fYy4LVVwDLl7WGw/dhxWEK7EIKCESBVZ3xfxSyGvfWIgaqTTK6+Wn1Mq3YxKfKdlizt7K0zc0tx3+/tLuHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d11e3VS+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d11e3VS+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477b91680f8so75817295e9.0
        for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 06:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765375610; x=1765980410; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9e/kA6oIOyhPzKZ7ArQO0A4zv907CzD/WHILb6v+0H4=;
        b=d11e3VS+FuWCQmjJv/8VQ8uuTBLoF5smnVZA//5pGzIjMGoj/uzPgMncQWXgYdB9fA
         oOkeKNttBAO6qqgP+JzypXmYk16GJeiYNPCBramlfrI7YMnAzK+Thr7D1DsjKndJ90bJ
         oH+v7zC68EIwhVEM/Xc65r9ZdeLH3Quc4q1bl4hSjy9sTPtauL0gC0bF2BoUx44pMIwa
         0vms6K//kwSY8Ln9eRn82u6MWhhP51Sx3COSx5Ht/AL3ARsdsJGqjoHRcrHLvHXuSi/k
         08wNF2gf+azIacw+tWzB4wMTxgl9jSTRwX+1y6s+7Z/ZlQ3JujtvovkWrleF8h3depy0
         lnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765375610; x=1765980410;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9e/kA6oIOyhPzKZ7ArQO0A4zv907CzD/WHILb6v+0H4=;
        b=c6YIbUqv7sS3hOOErTO7F9qwTY19HmPOyZngx/jQTyUk/OXkFkZnQIEjJqTWre5Cyj
         KhsqkpqwhTkzOQDmz7hKI/z4cQyNue2wKjyfauoIqE0eqkwNDsM5yY/kQneSaBMrW3F8
         aUyb8yX2XjYyr0GJ9hfxzQ6yKcn0Y+W37oWOX/byU4w7eQDdgI21Th9BszfWwDtw49lZ
         Q5Lv8rCCUxF0ObrCN9o7s/oolSGgXdLbVLawS/M3kDUFiVRPOq47c1hRSVnSLmqsr4qm
         S/FUJTfla3EAxiCMG08CnZDnBzeHTYinMMWoGT3cMHAyaiIXajz49GWDr9TP+1EqAgpt
         2pog==
X-Forwarded-Encrypted: i=1; AJvYcCW2vBSt4VDK46y9fso5hqLFSiYaYw5H9wcci3Sakcx/8N1rTMjSfSZShTor4jj999n1Wb35rJYFGAnKww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/XpdVB2+C860zI8erRGboZuKhY00m36ndtn9EgOvNf1rOXfct
	s9UIXaNYL58/V7VI7sbx9ptC40G8TByfOQGSjeyVvoe2mnMCgLLmerAyN7qiqmg4c8c=
X-Gm-Gg: ASbGncvnZlvZEh+wsAYGmuLEaty7RdVJHb3jp3rmS9Hvh1P8/efC63ZTiw4nETNwPX7
	2B271XKzr3/UDp8jxk+3KMSCBDMYVIWWIl2cK9qPOPi4+Qi1p/6UZ6/Mtoxg8oka0SMlNthqj+6
	Ou22wcYqk3HjvUKFJ94oEgnIMBO6UUWcHrwunMR9y1LiVLaD00u7zIrUFSf5kFqGMmlIkycFp1N
	1FcStYSkC8+3tywLrWc+wXmimlM8jL470JSzoavQv/+ioLEJRq9XrZgs6BENTykbZFlUmWqRKsc
	HozNH1mq8KytCjokL0gcsVoOhAptgeT/q0Jp03azrnkMNoxcna8mY3pFt1Fi8A0c4yjUtcGYhmH
	iUPSn7oOPIH0DYRSqEA6VMsqBlqyQR77y3xuBwBfa5K0FJy21d+ECZYzcdtQhjSrnckm/wUPUXv
	SXezBBSOsAIpin74mQ
X-Google-Smtp-Source: AGHT+IGxMmlCENm65g/khz8an0IvkSqbfpyWL3jSQKULfpF/64kGTl6NlqmP7uQSZpTUXP2PqVLfcg==
X-Received: by 2002:a05:600c:a086:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-47a8374dd5bmr25998775e9.3.1765375610609;
        Wed, 10 Dec 2025 06:06:50 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:6c67:affc:583e:e754])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a82d20247sm44814375e9.5.2025.12.10.06.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 06:06:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 14:06:49 +0000
Message-Id: <DEULFB0XJ883.3CHFIXANX1FTH@linaro.org>
To: <david@ixit.cz>, "Srinivas Kandagatla" <srini@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>
Cc: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <phone-devel@vger.kernel.org>, "Robert
 Oscilowski" <drgitx@gmail.com>, "Casey Connolly"
 <casey.connolly@linaro.org>
Subject: Re: [PATCH v3] ASoC: qcom: sdm845: set quaternary MI2S codec DAI to
 I2S format
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251115-sdm845-quaternary-v3-1-c16bf19128ac@ixit.cz>
In-Reply-To: <20251115-sdm845-quaternary-v3-1-c16bf19128ac@ixit.cz>

On Sat Nov 15, 2025 at 6:43 PM GMT, David Heidelberg via B4 Relay wrote:
> From: Robert Oscilowski <drgitx@gmail.com>
>
> We configure the codec DAI format for primary and secondary but not the
> quaternery MI2S path. Add the missing configuration to enable speaker
> codecs on the quaternary MI2S like the MAX9827 found on the OnePlus 6.
>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

Best regards,
Alexey

