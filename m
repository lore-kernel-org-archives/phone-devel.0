Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011103A7F58
	for <phone-devel@vger.kernel.org>; Thu, 22 Jan 2026 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769070736; cv=none; b=OTLcROXVrK9x4fid5f7jdlEkMPEq+hj0uls1els7e3ntmGPt3EYLQNk0BdqnICwJLwy1B/07aXQZ0cg1djDTAJ2DoGjdvGHoMdQS0NmsrzS17hiqStdEeX66d3ayuDEhzMZ6RtYTXZfFn8Y0e7k88ZgfMjXJ4kMPrPqHRp6CyGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769070736; c=relaxed/simple;
	bh=uATaKfecwuZpQlE1wgafrpigCMzAtsS4/43cAsKSuyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DluED3yzzGIizRbcvcem0R69Hjx5CLICWqEMKgbITkW+tu9B1HEj5bw5LO99JvdaqHz5fnMVpav/06wE6ly6Ovr1/okRvhI8W7JhfupxWcfV8HFB1caVX59X4VARLrTgFgzwluCws40OxJfRp9GVZSjWZDWIP3uWvFqKxwzRpgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/JPliBO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GCgQBccA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/JPliBO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GCgQBccA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7cJ58108523
	for <phone-devel@vger.kernel.org>; Thu, 22 Jan 2026 08:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LB7h5TBBAjWDecbOflZxYmaW8tipfD/xijV1P46UIYA=; b=I/JPliBO7FAYLWCD
	18cZR9dv1dhXIdnILDga7Fm6EGD9281nA+oAtHNWSbogUQFNePibusYGzYU4xKUZ
	lC1NtxgAi80zP5BlUEPoNeKQ4Z+AJJKA3sGjLYkb574D780Ljn+H7fMkpMfX81h5
	ZtxBfBfY5FSJxlm4kPXfqS72VmrKd18Nxk3zFxHAFwfH9L3U+WKSjgSlTR3px6hK
	Sn9WTyjZtMSUKF59vdO+aFSLAugzBu8fGCs//CieBQwL/RF5aDIqG7bGqMpMUCEy
	D+2dO9Xn/86D1Df13Lw9BwBD1PqhVS+Q1J1pkaPreQDGsInMxXYyxaJ8K4eUcTvf
	N0V71w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pgsp9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 22 Jan 2026 08:32:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c53892a195so18048885a.3
        for <phone-devel@vger.kernel.org>; Thu, 22 Jan 2026 00:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769070732; x=1769675532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LB7h5TBBAjWDecbOflZxYmaW8tipfD/xijV1P46UIYA=;
        b=GCgQBccAUfA7FnwzBgInyEIZlkxx7El+OMWWpvNGqciFM+lIUlnm8MglH+pHihHis3
         XaCkAdSUyYLoIDg0IgFT3H9UmSAplncIfQrlGgNZg+62zPhz4RMcSxOrRwR9fm3ndzxr
         7KnOTZ3Bh9mtEdhCQEXjNMpHlkEXXZ7+8hJ1R/HycOyEPGz4VWaQ+5sS/z7cOMS70Vai
         TpiQVmgC2gEmhVv1EgGC8nkxMpgOrt6b+Gff5Wxbi5z0cb5xhSSpoZTvifj21WwhTO/7
         EpvBxQipRhYVfiR/cwjgQFgP7eAwgRpXEOBQgkoVn4VigZbGdbzgWUm05FUS3bRNS70S
         7miA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769070732; x=1769675532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LB7h5TBBAjWDecbOflZxYmaW8tipfD/xijV1P46UIYA=;
        b=r2pl01BH16V5OpXisZ/VyLxYIvDJ/6CV9vbsW6PKCRULaA7nQLU5bhOcI0UFIEFYxv
         5qx0GdYJUP7FkALBBtnDcJdeBDjWetiWOheQgEr7eZLo362a+rzKKCw8Hsa9EW3Tg401
         Sdt3FqCuq9nQ8ohiXEsxtWGNMlSKM7T4tXOXdgOtvE5SNHuyWu6JN3JXqUoeFOb6mVM3
         a5NdNipq/k+YJrOgVsVCgxaYtGLkVLJlKSQTRIpfcgQ8qCrzoSHYzxPeFyxaD9NvOgEF
         Jn7KX8k08rUTCKPovVwx8Wx+R/ubkgkYNSex9Hzvn6yimLuuHFIn3sxxeZSSy8b6mGEx
         UXRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUn0oqDOUwkW2g1HoQNzfz/RcGTwLpRg14lNT5IeW9ZtjANvu/14eJYxb0Uk7+u6L+3NhCby07+Zv9Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYHkunidzCVd3RGg4VMZTZEhHqyOGHnsfPd+SN6HtSjNN4/jwF
	70nz4GC8wAppSidzI7mLFVO6auAnclBUbErRqE+kFwLzSVf5UhFnXi8l4TBTekioOUvyvZKyju7
	YRcDpB6y971gmzxPyuxJAQX6n+hxpUrojyDpZ1nK19xUjOgOCwD0OPzmmFQ7gcEKCzr1XrpQwtw
	==
X-Gm-Gg: AZuq6aIgWbGyEMsrTAV3fLHe+SyeaUCIINoSwPaTMgFvENnByNhvTf2/O5dyTTN52CR
	iLUstOmnX6NQ6XKS41thfxZvut56tTED6KwdrEMRqXHD4M1tNyrn66q0fe3+Lyl//dxH24HMzJZ
	m9V+Z32FJHMJ1GRWDUtvpkMtAO62KWwUfhnbA/AeHOEy9vrV74vqjJdBE5bgG4N+cUjQpElIQf0
	6KWxww8VG5j/mmP7zg4rc/VRmSL2tmqsDRUVdMKa0M64F0CJmk6P0L22AUuCo2wTrfhv8OTDyi/
	r3baecuutuJvOjLC5wXJ77Dx2PU/9EVzk/fDSqd0iH99ZM0BrWL6OD5ncXMHtYFbr7xELI2aZtT
	nFaziL0xhxlC0tqbKfnlFIIiCEeXPYYLbLrvmtTMvcCgACXrBM50katX4zw8hsdoGOqw=
X-Received: by 2002:a05:620a:1920:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c6dafed670mr207525185a.10.1769070731569;
        Thu, 22 Jan 2026 00:32:11 -0800 (PST)
X-Received: by 2002:a05:620a:1920:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c6dafed670mr207522885a.10.1769070731024;
        Thu, 22 Jan 2026 00:32:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9f8dsm1646666766b.36.2026.01.22.00.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 00:32:10 -0800 (PST)
Message-ID: <dfe91e99-a686-415b-9211-7cb774e5343c@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 09:32:08 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
 <3a17f2e5-0724-4d70-bd22-1e612142b3e8@oss.qualcomm.com>
 <DFSOPXFSOUY2.2Z6XCLCD796Q@fairphone.com>
 <wpjvuclvpjft7y2rlrmfgszkzmc5vvmohif3etqrtvymxjjyjk@h2dujh5egdvd>
 <DFU439A9HP2H.1Y9OS2OPAXGOI@fairphone.com>
 <t4yjnuty7tmvs4vqzm4vdid7oowicy7hcnmqmu6nqtit3yru55@zpo6kprnarth>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <t4yjnuty7tmvs4vqzm4vdid7oowicy7hcnmqmu6nqtit3yru55@zpo6kprnarth>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA1NiBTYWx0ZWRfX+34f1YnutOKa
 4suYGhibe125aHxMTDAbFSO3FLk8DI9CMok+29kSlDFogw65CmWhNK/N121S3tFSDECDG9rENAf
 0+tBOkXH7yoq4o11RTaDz3N7VIuJdw4Po+xCwvW8AA5+avjCJfR2PuubCwxuCq8tQ40msVYP5An
 vCGjcVsWrMjmMbvyN9RkCy5EthVcOsF00RBzA+HFiALZHVATqHaeuMIEDEZthKtyivnl/vWWtEx
 5LTFmpLTa63zLRFwEH7f5KYS0LO+ktuCHo2VDKz2E1Xv5W8maYy3pS0difFcrgvLWczJiQP683q
 4m3ZTy6RmdHXx/W8u+E+A/RchHixXTY2AbbXp6TzoNJCtrN77fWLJkRhpc9N/SQPD95UpJMxJvM
 1S2NO2aSW9xyz19WX4ysOZsZa7EYD5hekFMGWUK6rpzmKZXY8Rx3GXflDKlMczIVv9Vy3dVhU1a
 Hx9JyLXq2tuLOQmIDwQ==
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=6971e08c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=8BatEDlHAAAA:8
 a=miy9QUiAF7RNB75P6oEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Soq9LBFxuPC4vsCAQt-j:22 a=tjV2R_ox5hktXOQLSeCq:22
X-Proofpoint-ORIG-GUID: XUlOg4mhl1TbAgiO9qOaOtxl-tlC5DK_
X-Proofpoint-GUID: XUlOg4mhl1TbAgiO9qOaOtxl-tlC5DK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220056

On 1/21/26 9:06 PM, Dmitry Torokhov wrote:
> On Wed, Jan 21, 2026 at 09:07:44AM +0100, Luca Weiss wrote:
>> On Wed Jan 21, 2026 at 12:05 AM CET, Dmitry Baryshkov wrote:
>>> On Mon, Jan 19, 2026 at 04:52:23PM +0100, Luca Weiss wrote:
>>>> On Mon Jan 19, 2026 at 3:41 PM CET, Konrad Dybcio wrote:
>>>>> On 1/16/26 3:22 PM, Luca Weiss wrote:
>>>>>> Add a node for the Hall Effect sensor, used to detect whether the Flip
>>>>>> Cover is closed or not.
>>>>>>
>>>>>> The sensor is powered through vreg_l10b, so let's put a
>>>>>> regulator-always-on on that to make sure the sensor gets power.
>>>>>
>>>>> Is there anything else on L10B? Can we turn it off if the hall sensor
>>>>> is e.g. user-disabled?
>>>>
>>>> It's the voltage source for pull-up of sensor I2C bus (so
>>>> ADSP-managed?), DVDD for amplifiers and VDD for a most sensors like
>>>> the gyro.
>>>>
>>>> So realistically, it'll probably be (nearly) always on anyways. And I
>>>> don't want to shave another yak by adding vdd support to gpio-keys...
>>>
>>> Why? If it is exactly what happens on the board: the device producing
>>> GPIO events _is_ powered via a vdd. Added Input maintainer / list to cc.
>>
>> Yes, the hall sensor which is connected to the GPIO on the SoC, has an
>> extra VDD input which needs to be on in order for the Hall-effect sensor
>> to be on.
>>
>> See page 133 "HALL" in the center of the page
>> https://www.fairphone.com/wp-content/uploads/2025/08/Fairphone-Gen.-6_-Information-on-how-to-repair-dispose-of-and-recycle-EN-NL-FR-DE.pdf
>>
>> The IC is OCH166AEV4AD where VDD is (as expected) "Power Supply Input":
>> https://www.orient-chip.com/Public/Uploads/uploadfile/files/20231014/1OCH166Adatasheet202203221.pdf
> 
> If we add regulator support to gpio-keys do we expect it to be
> per-gpio/per-key? Or we'd recommend splitting into several instances of
> gpio-keys so that there is on set of supplies per gpio-keys device?

gpio-keys {} is very broad and generic, I would imagine it would only
make sense to keep it per-entry, like Luca suggested

Konrad
