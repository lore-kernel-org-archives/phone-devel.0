Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A191A267
	for <phone-devel@vger.kernel.org>; Fri,  3 Jul 2026 17:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783100205; cv=none; b=D81zx4rxeF+Q2kHwd1id84YSschbV2G9LvP9C1QSYZirqn6mnUQQGgaWpv6bBsIQuMnfQOwtIU030quFeJrDR9PA9RqOILIx73ZdFrGOMQtjcw55Skl2OwUN7vrT0xbGDzAxbFqpy98tFYJVs3ebx5DR4mE8yRFyeWDpKmQBpiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783100205; c=relaxed/simple;
	bh=UqIn74vDfHkpSSpIDqvrqWCVWTw6WrgqocAQXTALwIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTBz4D2/ocsVAe1uGHdFO1j+sKHHmscirOQxgYoOPHAP+fmdWUPyU5Iv3OarJb9La1/zE7s2WIh6OXLtkd/OfD4fA3rhWiweZCILm+1dR2ke/Ay6H4uNBJbjh+VCv4JV0NLCJLF6HyChlavIBOp6HZSHyphHlACEbYV7iN80O8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ue/qOweb; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ue/qOweb"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664d7863920so690532d50.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Jul 2026 10:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783100203; x=1783705003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swFOHxWnwsi80sOoNfpTLmi7to+o78mL3eziN/+vZ9o=;
        b=Ue/qOweboVu7n96wWDZ7dCNUMjEco3TT/sUysOemX9WDsblD9kFSmwOdx+v+QEbXFE
         c0FSKumm+xHoSAokBbLCN1iPVZTSiNNsajvDb0sZw6Bcpc5ncSy5p2vKKoc9cW8Qdrxv
         rx0o1m0CQMLuIeolKEa1nCCIxpc3kgReltAF5RbupglawnxcvE1WCakTOtV9eH3h8zX2
         6Rav4+4YpjaBeNK1Y0hxq+p8xfr1MegRZbDI+q3L5lCZITCZig0mnAHr7B9mp1QAnOg9
         WRCmL1Eb47mhVC3re8DV9QsV84nBbHIf1BH3alrhciBpvrDMrIRftIiPr+meygOS+aTl
         oHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783100203; x=1783705003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swFOHxWnwsi80sOoNfpTLmi7to+o78mL3eziN/+vZ9o=;
        b=nxSWfk0cuCK/xBJBP0shr+97umK6QWCk9HFwvoJswyFpXU7GoHoLr8Dr0hfbIyJGCR
         GImbuFqShPWekRqgP4G2taEemaW8mH3DhiXmxOPZqspCChuFTCR6qNow09WEOPFJ347E
         eSI/C/gtahK71DSfky81lDnD68l37Ty9AcCEJH7zXX1rCykziv/BpfUl/h88SVG8bAV7
         064+3Ic0VlwJIF2rzkZVM41eZ/9W3GkJarHdlXZemBQ8OBcd9W3CnmQJZR0iA56PKnRW
         /SIOqAyJVQz1thXOD9UIHrF1lJAwzer64N1o1JWTzrEnEYEqegOiTP+xip/Vw1Zw0FEA
         4x4g==
X-Forwarded-Encrypted: i=1; AHgh+Rok9PbgXCQ/2k2QBXM0ntV5QDl5ldFrCh4TWhhD+rQnswWHCbivtXg8hkQO4ohjYWr6d8CHkW56dCecnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj6pQ38Z+rEenk+J2ZsIhTS2GmHYobTCRTdKACVVBaUphG9G/y
	LBY2X4tHIXBzTlj3rpq4Kiq9qP5EM0vqOvVqtnJ0OPSBV7Ky0vFaNBTl
X-Gm-Gg: AfdE7ckH2MGesNKxEloyreN67i0Rt+IP8r2tg2/Q3APAXjQMwH4FDM+hab5BLspRtbz
	JSfvzzTweS0HxBMJbmPV3UgkQF8Oen/JBGmr4n0KMgm1DIWmdJVBNZHElsDjU/zQKUuuclvoQRa
	ySQrgC7mwEhylC3OPu1PAVlzBeGWDHC1oKozQDbWeFSvOBxvRi3dnu/gIGGLwNwzfFCkgW2YQtN
	6plZxmZTkEYH12JTVxSGRrLCnPbx19usKvYUVEEqnGNearKqV5PuckDSH5FBDOHmlEDAeW6x2kU
	qQ9b/YsjRJs7FjLhlxfjTpZuiez7ObgkPAmcbIRULh+gRorMuGLD68hnG7moWI16yjM6RLf8kKJ
	XpNWmfJ/p942e/UZq5T1oNEt3QOwprG4mS4RRa/KUHb7RQjK2yAylIIai+mfZk6O+3QK/bwRvdZ
	KZEhASv9isU8J16+8=
X-Received: by 2002:a53:ac91:0:b0:662:f405:5d41 with SMTP id 956f58d0204a3-66652e3dd28mr53777d50.33.1783100203109;
        Fri, 03 Jul 2026 10:36:43 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6664087be45sm1050084d50.19.2026.07.03.10.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 10:36:42 -0700 (PDT)
Message-ID: <32510c42-5448-440b-867b-c4b7404a4dfc@gmail.com>
Date: Fri, 3 Jul 2026 20:36:37 +0300
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
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>> +&apps_rsc {
>> +	pm6150-rpmh-regulators {
>> +		compatible = "qcom,pm6150-rpmh-regulators";
>> +		qcom,pmic-id = "a";
> 
> have vou verified your reg settings? incorrect ones may lead to
> hw damage
> 
The only deviation from downstream I have is in ldo5 in pm6150 where
Samsung set it to 3.3V exactly, but we can't pick such value in
mainline, because it happens to sit in between a step. So I set it to
3.304V instead.
