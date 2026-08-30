Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E1A280037
	for <phone-devel@vger.kernel.org>; Sun, 30 Aug 2026 07:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788075422; cv=none; b=uZljeOGkYRKD/Zq+FHftnbIY5ydOdTLDkRa8urnsv54l33OmRM9TcF2shPMUOu0o4eWiwpfsXd9lDUsWCRpkUFopIBxxRUCpstsOPfVC2mLozLfnWS/cMCMuSa+uDOsBxw+oMka0iI80KHfeXF8eXC+Cw8JjJscz5NOTq81hvuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788075422; c=relaxed/simple;
	bh=7lwjYtbpG/4E3ybQ9cNUmnF2Qr0zI0DNipARBzxmj30=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=I7QLEYNWdkR7drQWlyjy6erZgvk62LNvcJcWzsEVCubXfh1eF5MqVSQ7myJLS5IC6GXPsdcWr9OSnUjEslArH93J5FlB/rY3Prmc8xe3Z7YtYo3ANBp0V0Mjp8tKRDwTbTfSgiN/uyQVeMSP/kNeiqbQlAeINrLt/Zg5jMgbN/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFPpli9U; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFPpli9U"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ccf2360620so19776195ad.3
        for <phone-devel@vger.kernel.org>; Sun, 30 Aug 2026 00:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788075420; x=1788680220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lwjYtbpG/4E3ybQ9cNUmnF2Qr0zI0DNipARBzxmj30=;
        b=eFPpli9U0E+KxnlfNhF/6Io7KcyzbXzny3HXdFsAEcjFuAMKz5F29B1mtMGwMolnvc
         bpSQrWd4IDAzd8tnOkYlomWNj/Qb4TUxqlD4/A1iZfZXO3DuobAEhSNUBjwjtFiDMqVe
         qR/9wFhUxQ72lsQAsORWa01l/XKSMXG0oclFCgX+NLTdIs+Q+Hi4iRKugGfz08hn6kwc
         +ona0Ip+Xbl12oo48NKiFZIdJKwwOramcCieOhnuR0+hsrNYWCgmUvbWTe6Y/9Y0eLr2
         LYX4mzXy5eELgOSMc8KvJcGHtPfH4MbLdXOOoduFn8kg6a+8KciQOHzD5Aaq6uXimBFo
         nOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788075420; x=1788680220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lwjYtbpG/4E3ybQ9cNUmnF2Qr0zI0DNipARBzxmj30=;
        b=WOPJpfIWemrqy6uTFzPygkpNslxJbSVUfjcI/FwY0/gKRbPRuozJO3GeTlAZG5BK/Q
         fvSDK/ITphs+NDuOo2oXm0jhr9M37sq+CBriB4HoieLBycDzOrebd4WeWM9C+RV96HFc
         l+Dp+ILZnMo+PsxsMZZZ1dn9dhM0Mvsj4g8dpUue0+PramqqO8IVvJA9mijFI0rRuEj6
         +/Vu9bCCTsLnioq2kqGNPByt8CIVWEPmjaSy+T9va9pRUVVZuB11RrBIPlNAao/UjQ5j
         iuDj9PfUvxtGtX3pKMG0QZs2qzuF6+QM1tWze9VLxvzmCpE0R7gWH5ItmKnoW6X9L88f
         1/EQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9p/Lsw1PNvkXqJsjvpCRh6tHrNVhZzQLJsVYoLKRMWoZxfESSc1zX8ju1tASHZTu76U0hJshCCYg3Lg==@vger.kernel.org
X-Gm-Message-State: AFuF++nxN4LPygITa78DpepL4RLdT4UJb3N2d3sfT0Uq8SfzEQnfhCPh
	GAC5mJKTfUZaVniNzCe0eAqhM0Bkp4GliD3nyM8+GEiQbJ2B9wqLwfcA
X-Gm-Gg: AYBFou2+YEOqPeXGYfWKOBzwL4K24ZPJYyY9NHYL2oZ2m1fG/CTbuzvZnHz4gQYQUKR
	TrOnDRuQgY6jCHhN0Ij5TwgdRwmoLkjKRiklyPNCTDDSk/6R/XZf8pCWI7WFcD3aKZOGY0DMDeN
	Rc8PmT7eWmw/x/sWDZZ3rIa2eF7ILM3MK/4GhutOl5nN7BzwRKyRaCnpD7FLUzGGdKaw6hwx9j+
	mKLIwtwMsdTwIZBXQCroWDfNovccPoah66s1n2L/hFer+y8Y2E/LSa0ypaLcCAg/4XR2qhZ+VgS
	+WZ2iDqU533nwKxM1aoF+jm3UtungnfJp6x/0UT17R7OtF5hyakaoOcY77likIsyMKEzEOFJQ/c
	0NYMI4KN102/rPos8TvDLyaU2aCJbC7t5qHejOPE+T7NnhxZcfYprSZhHbxTfO9z6kfTEi0nhD0
	MjPsU1i+GGtg2V+qCQs0S2Gh+nZmHLFXDaDPN52U4B1JUu848VN41S354DSGxO+i4qGhGo6D+zB
	pD525hSXm32uKySIwk55wFNuoB+wRBLR11Jb4vtUkM=
X-Received: by 2002:a17:903:3803:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d74df0328amr332620145ad.12.1788075420167;
        Sun, 30 Aug 2026 00:37:00 -0700 (PDT)
Received: from [192.168.68.67] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm25390894eec.16.2026.08.30.00.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 00:36:59 -0700 (PDT)
Message-ID: <037b393f-4b8b-41d5-8a88-e0d4c2e28416@gmail.com>
Date: Sun, 30 Aug 2026 00:36:58 -0700
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+muzafferkadir.mainlining.org@kernel.org
Cc: git@luigi311.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, megi@xff.cz,
 muzafferkadir@mainlining.org, pavel@ucw.cz, phone-devel@vger.kernel.org,
 sakari.ailus@linux.intel.com, tomm.merciai@gmail.com
References: <20260829-imx258-add-reset-gpio-patch-v2-1-bfd27891e225@mainlining.org>
Subject: Re: [PATCH v2 1/2] media: i2c: imx258: Add wait after enabling
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260829-imx258-add-reset-gpio-patch-v2-1-bfd27891e225@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Great series! Enables the back camera on my Pinephone Pro.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>

