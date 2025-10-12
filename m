Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55551F4CBC
	for <phone-devel@vger.kernel.org>; Sun, 12 Oct 2025 06:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760249014; cv=none; b=QiIZyY24G+abIuSm1Pd8FiOL4Gty80H6cHIKjiQXKy+n2/rJq0LbTPgm4S5o4IlPtUkcayr7CDe0Qv5zCFFS4yD6QeNtNKFEd1yZJuCAwkuwCZs+b83CyOfpBCNTOWthD7b6gON8LtirJghFkGYS86Cu7k1wTvH/+6B2fbrURa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760249014; c=relaxed/simple;
	bh=EL2sXnkVXyc4/0xhj1/c7GTQHDex3rg+30WyKQzgLNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4vVWb2JZXXeVeVEEAM749e4fHMwYf5ywdjlWm2VJAkENqhvy00ghn9TroDtcMAsH/2LvDJzUtao2sDJFFPSq5hI9DeTNMlxh4xi2HersLZN9onQEt23zlAUPJoTbHgwQUt9vLPDn7o1h3W3XpEDgFxtRM4pKwYlOiyzRRHIXxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org; spf=pass smtp.mailfrom=me.ssier.org; dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b=O2LUySFq; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b="O2LUySFq"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-856222505eeso407483885a.1
        for <phone-devel@vger.kernel.org>; Sat, 11 Oct 2025 23:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1760249012; x=1760853812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRm9xjoa7nma870h/XmiqTo0QL4WR8G5o5uredUdibo=;
        b=O2LUySFqouNdvHjJuev1tGTrotwEqB2FM52NnvKpwZ6XuDTMrirUL8VemA4BtRa3UZ
         HjUIVvCcA+rZVR5e93uqw4WFpvO/WhLFlNFbQWd3LdOHK1ehR92kbVOBvvnsQOKeK1QI
         wNKjDHZtfppO6UqnETgyX9rXYzUffSyPYeoJGkCOa/pC70LgGQwVXyv6cG5lWuG7Qkov
         u6cXsK1Tzs7E8+vcGLSjSmbK1tmhuNKwbgV9t11XVD+tcS3EQrT34K7AOkCyiQDUXBJt
         zOltcv2XA98rbL8Osu8TY154AbHz51yUKalc/SYWIyIYUF02CAxZcyODwbIkiybJowMb
         JKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760249012; x=1760853812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRm9xjoa7nma870h/XmiqTo0QL4WR8G5o5uredUdibo=;
        b=n2pb2KEN1BZJOz0LZSQveAiVO7ghjDzezavcjvvOrb2fCFDPI1fz3qxeJzU7RfHMny
         nSF1ywyxrrPxJVhVYsnGxdabOxV62xTIVxXx+o8sth7MaBmXRxHo6o2EMbHZbiyXjLk+
         6rorIc0xDaoEC0mg6kxkTZyp0LMcFRbHuw/yRsG6yj+rldz+1icVo6ZwAS1Yx5B7kb7E
         bvNd/OzpKrJTg3/mUC3elmetkFOfLEaEn8pK7lrajlonW+yqJZbWoZt8Vf9CW5WdtMRR
         yQjuykEPhhQPSgRmiNMlBKKQ8HLgx3sxjGCykNDFgBwxTZmBcRyE2ZgPlRfsZpFw0qOS
         km6w==
X-Forwarded-Encrypted: i=1; AJvYcCWPPUSdT1MDJPUzJ7fJv6fNfNm/nhPllnKdrhiPUe1hxA6mafNAfju2wMZC2vr5xswKCwjV+Wq0ionhag==@vger.kernel.org
X-Gm-Message-State: AOJu0YweSzJdYOFWXAui6rx2e9O/XJaq0O6T6s/O+uMQauYlEx98In1K
	/WzispuLsVYBxjafyLX3adToHxvThZ/n7aR4kXnFeGZiLZ/YeWpsnUiE73xhAMtu8o8=
X-Gm-Gg: ASbGncv07aKz6mmqhNcnK/J3w8IPGZE8wFGZHO5JKW/+EbMoxhYHkiVAK5AjOyejVqW
	GW1ZatMc33197Cud8J6YvoDhoA9wpxaDRLxN9EaqjFg+gvpW/vwrQivubX47BaiJMTAF9VugYtJ
	Zy/6wcoCA3Zl3o4zhIXJQtbMOFWmyVNrR/jS4fnfAFsRXRUJX/zY4m8IiF9yoIB4zaQtmANoLeL
	5VUxahn4eILVA7LQvl3wAxyW4j+ZbEajLVjhJ1CGtE9NxEQ/cG979+pCILzWQRSQuZb7O7uFJjD
	cdb4JqvyATbQEGv9eBb1ClAjE9IU+N1F5IOwtrsgQXQ8A7vQFhKq9luIGZ60wAsSd7vVzaCxT9/
	1WYjeOeD55q2gl09vJC+YpScdWgl0YzMw80c/X88GPo0dIHhHnugo8VLNrj9oFCuGZVwsTEIIt9
	QkgXojRkYAQGnKNDKXBYYpfZROndNr2N/AglEMUJU=
X-Google-Smtp-Source: AGHT+IGLhoJnin+O4om4Te+bAwuwm/6HPtCKLHtCftsCB9hZmh2J7RkjVHXeDb2T0HUlNqxwL0iT8Q==
X-Received: by 2002:a05:620a:44d0:b0:863:b78e:d159 with SMTP id af79cd13be357-88354ea751amr2282466585a.51.1760249011609;
        Sat, 11 Oct 2025 23:03:31 -0700 (PDT)
Received: from [192.168.2.8] (bras-base-stggpq3702w-grc-09-74-14-126-215.dsl.bell.ca. [74.14.126.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a1ca3defsm730315685a.38.2025.10.11.23.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 23:03:31 -0700 (PDT)
Message-ID: <fef52764-3092-4375-b9c7-793d85adc102@me.ssier.org>
Date: Sun, 12 Oct 2025 02:03:30 -0400
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
 <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
Content-Language: en-US
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-10-07 06:03, Konrad Dybcio wrote:
> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>> From: Alexandre Messier <alex@me.ssier.org>
>>
>> Add support for the notification LEDs on the HTC One M8.
>>
>> Two LEDs are available, one amber and one green.
> 
> Do they form a single notification led, or are they supposed
> to act separately?

Good point, I had to check the phone user manual to confirm. Indeed, it is
referred to as a one logical notification LED. It also mentions the color can
be either green or orange, it does not mention using the combined color of
the two LEDs.

So I would say they are supposed to act separately.

Hope this answers your question, and let me know if more details are needed.

BTW: I will be sending a V2 to update the color name, since the user
manual says the color is orange, not amber.


> 
> Konrad
> 

