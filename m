Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816043A1686
	for <phone-devel@vger.kernel.org>; Sat,  4 Jul 2026 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783155393; cv=none; b=S2dPM+cwwfF/UQr8vQNu6robImde0zGv9GA1soOLAc1KarFMBbNZJdw52+wsNALhHx52h+lbpSOi/6npgRpsCmyF3i8BXro4EQ7VrBudjSk/p0Da92SJIt3xaNLO6mx1jLUHmrWE/9J6sA1y51UXQG0P+1RORxAJcN7IkZaEy8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783155393; c=relaxed/simple;
	bh=rw7/9OzqfRsTbCam+3oyxvlooacrsew7P34zffYaA1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OF5pDHw29ECLVElZl7VvriPLWQl+GEXWlJQzKkOCP62qjHGl85SuFxgDj89fbOUmOXRD3qcXDVwLdPVMf0V1Q6Nr3lGgSBUTyfh/XwwxPFO1/xSn2onmSmHgX1zFNsXEhgnTORMO43SwmeJrOrYl3O3/0dE2c15u+iCk8KC/akQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIgLsoGT; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIgLsoGT"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-666c0baf991so252567d50.2
        for <phone-devel@vger.kernel.org>; Sat, 04 Jul 2026 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783155391; x=1783760191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qu6q77m7w9BayCGazNEgunJD/MBAGV9RI5qqhQj4Q+8=;
        b=RIgLsoGTsK11TvKbesAz617bZ99ittPVQN6SeCwaf2+1TIc8ccGnTllRrrxYmIhwIq
         Ppzk4J8LnRfTN4hmUeDY1WhV2H027iraQRs3cOyM8kg6XKUcd9JaWo6KAD5o9GPQgB55
         NB65r3gDQ0kE4uOQqqWFCvm12cZPbNQkbsmPzXDNDvol3Z7rrMM6u9HpE1zsjkBPl/BT
         /SbkFuda1ZBqH95LLfXbRI1ecU53G/rq9Oeq/jvDfvFQcHFYtv4Wnhxefsl6h1C7iLLE
         4pbVq7SRSNKXRlA88snhqciUqkERwYmELb7laV/W0qBnaKE9E9z8WwMTTkZJN+tZJuBX
         ltBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783155391; x=1783760191;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qu6q77m7w9BayCGazNEgunJD/MBAGV9RI5qqhQj4Q+8=;
        b=fkAK8k2O4F/P/dCXuaw1NWTzRZBWW6H0SYP0AeN8Myy/Hz4hS8HNtOGqBCDKWSk9D8
         LdVLNWhB+f2U1AGGBQ5EfuYmGLRC0isOl0AeDQkYRBis8FHmMtimeqncODpwtzuAjhsZ
         WvbWo0FLwU/vMdP+Z1BRnMrGymFZ0GaCyGYTzQ8q1yae5+v0dG+DrSS9wZf8YAxWakhj
         YvXQEchf4awBVoLXVdZPA1Hf+XX4BY6CVVwLOWZI39QN8C0C0vbX//4kgKeEuEc1h4Og
         3JghA30uotIsjgNFTfEa0Lj898fXYRXOCHsk6FAz7W41weF6+ls+kPnJegg15jlU0sQL
         L2Ug==
X-Forwarded-Encrypted: i=1; AHgh+RrUrl69vMR2ds752mOx6dxg7uQK7BSIHcr59nfvl61sGFhiPYa1W02DNqiRYezMomexqLLioQv8Xmd6pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhsJiSNvEYx4onqBYnDMo1cUvoCY59o9AfmUJBGSk+PCVMjzo0
	teRXPriZzpkVMMYxlhxtlSk7h9OtHTNF0aXBBlJmDB3cidnpYBsUA0sk
X-Gm-Gg: AfdE7cmTHuPikPxAZ/e2ec/0e6q1TTORp7OMZr+9s3Aiz1fZQJu4LNCtbPPgkv4xJfs
	932fZ6QnoTfDHf7cVTZl0veUfuszkUOLkie8vVJlFbZ6+oGpn/+Cl0S0DfG5UT93N2OZbETW+Ru
	g3fqEjXaGRxFCKTHPZ2Bp8JcEpYcrnpxIY+8jwMJW6nRgq2Dqc6sQLkbaqVCERoTYihxV1jT7Z2
	JZzEraRrYohNfnu/29uf9/J7OT9pxcXG/IYr6T+p2Ll2+AKowQjkv851TWh+acTodDS29jc/0im
	CHuTsSwAIFbzlrNrZPqJp3O5A3ZRP1YAkcIIRA4J28t+6fCzAS7InTQdlCZ1yGEfUz9qvFBQC27
	5tGVd2gzzt2ACz7JnIDZ7B+/780qnSBGBCEVa+4O2n3y6jvWb23LagEHSBK7xpzUfqJoLWdrvDo
	Gg5aRBoB8p6AzVJuM=
X-Received: by 2002:a05:690e:484f:b0:664:e430:cb76 with SMTP id 956f58d0204a3-6665306b95emr1287023d50.59.1783155391641;
        Sat, 04 Jul 2026 01:56:31 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144840568esm33528307b3.17.2026.07.04.01.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 01:56:30 -0700 (PDT)
Message-ID: <569ca937-205b-42e6-9842-a51a9de16b26@gmail.com>
Date: Sat, 4 Jul 2026 11:55:34 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
From: Erikas Bitovtas <xerikasxx@gmail.com>
Content-Language: en-US
In-Reply-To: <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>> +&usb_1_dwc3 {
>> +	dr_mode = "peripheral";
>> +	maximum-speed = "high-speed";
> 
> Does super-speed not work (if you also remove the qcom,select... above)?
> 
> Konrad

I can make a file transfer over scp, but the speed is inconsistent and
slower than with high-speed. Must be because this device does not
support USB 3.0 (super-speed).
