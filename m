Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174AB30E82C
	for <phone-devel@vger.kernel.org>; Mon,  1 Dec 2025 12:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593745; cv=none; b=HEZNCN3llMjYqb6EwmhHTRJ5gAujoPA+G89iEWVcFiW7iKj4Yv12vAeTTaaEVn7tUoMzDEuM+6eUth3FVu5grAZ6JddILXMNq47PHkwsRRFqR8nvzUainUAi3TJgygtNkVNVOHRttXgIIqCplAyvU0sDfS+my2qq3hycD7r93tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593745; c=relaxed/simple;
	bh=qjX1boH73SydNBCKz6rHEzs7qKGoe+IFikmqMqToHyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CwQ13i4jTUVfgVtrgJC7uuHdZMtQC2ADEgZjjUCM5AkNyV0wJurPdUiUwYyRLiVqspWOVDc+S++KFA8IEzjIbprt9yEEy3Pbjc4XAUT9h9aap+MSIcKQGiHyoLy7+PTVSSVzH6q6aCA3VhGQZ3nCdTuTEZhEI8UrsKNI8l/i6ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0BfY/UJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dk77N16E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0BfY/UJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dk77N16E"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1BK5IN106130
	for <phone-devel@vger.kernel.org>; Mon, 1 Dec 2025 12:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0bpogltmQbh7eQJBYiW+bKvhzS+VMTMFejGkBnimcE=; b=S0BfY/UJX158Rdxn
	eaO7DsrRTqxR9Jeg3D3Dquagr/XXW/x8NUqoq2cnpVD91mHI6awFGb+0+Rh3jhTz
	+RFjp5IIpVPa+hLr6H1xMi1C9p+Sitjxv9/agGXN+9XWNPAxscy2ZbVwZyXpXIeF
	Vfizccnc0lNSpk2ejy8tgz4zUr1Mkb0KBIhYW4K1EI7cGhA9fiS7ve4QiRscIJpe
	9OV0Py2i+Ygxd/PFdidpBGHb9QZbDEvKBr1YxrJt/kUTLkkbbYjKMQrj9rSN2CUK
	kg4dEySdiOqhvvm5Gf973QBVxGR27ox+rRYj5vUy5N1u2GKZug8jxuVqbs1+5HMd
	fKTMSg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asa2387na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 12:55:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ede0bd2154so15108341cf.1
        for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 04:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764593741; x=1765198541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P0bpogltmQbh7eQJBYiW+bKvhzS+VMTMFejGkBnimcE=;
        b=Dk77N16EBC7xrAX9Z6slMdyv3QO3I9v84DS2czXq66Ai6XPq00KJXDrF7uo0fgVjem
         Cs0KVdfKXBenocsYljEFH+0Qbrp8026oQSdWaMTt6Na4Bq1ficWdxFYmtYOGub0bvEIn
         z25oEZJqEZfZ1YOpIcQ7E5Tu0oKZzMjl2df+Ltm9H0vfY1IaVqof3XWTMg353l0ZqLZj
         i3GgoILlQz40F+BSwnTt2FrOIN5UnAUbVxw+QIu9aAY6p8Sunz4IG6m9vkyb5Qh3IobP
         XdgUEiDlNJu8EeD9xGAJQOmpPhISsWANwhaaKWkV2equKDUqi9k/ud5zYyTsNX8Ib1Sh
         TmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593741; x=1765198541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0bpogltmQbh7eQJBYiW+bKvhzS+VMTMFejGkBnimcE=;
        b=hciiT3mI1nnQ6//MKEKynB8ZQjeULa1UkO+naeqL1VdPEJThCNV3s8nd+N/4+dH3B4
         whoGF5FC6RdEvQySWaSizGBzT2QUZQLnOElo/D7naVoEUwWs1twaYkxQgkf2VrxCZuII
         X8pACBUU9CdWpivF2xUqNv7WOGXwvqKWpifcE+7HxsiQI9rkvOlA/dryfLPFjCj8Vm29
         DTOpPdCuCV94MnnxZRWmJIQ/e9O4rIiUJgZ8McMTYAlgPziNzVsG0S3bWQKsdycRoh3J
         ue6ktDPPRT2n/LnBpxXCk2Ik07+Ane+VtO6u1AFrfAhXxYkv5cgo30wYNm70AJ3w3p28
         VYOw==
X-Forwarded-Encrypted: i=1; AJvYcCUmmBVXlioDE7OxSM3MeZHMqrw6eKANbpn2mvFteioMn2+GlNU6K/XVFLCYR69QEMxHTe3n0+7X7rtyWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3W1tLqVkXyj3a0d+Csii3gPXADv6P3SGM5FdTmF9DVA15u7gM
	5ZDHz7xauUrBrOa1lZPMkdNc06soz+0HRJyl5pimpaYtvF9MlL71c7n2xm8HcMlEWyB1k3MS97+
	2B5XR5C5i5MeT938ITWOTAiSLmXRXsCUMmXDbUTLqRqrjkNLuTyLb8mpr/NChiYgsnw==
X-Gm-Gg: ASbGnctu5TP/t+Fe6VXZ9A0kv2SGnRGhrl9VsgdbFVZOASySsw0N2ci7kGNO35UxbqB
	krd6zNuh7kdnslqZP2ZarR0khQ/5ZE/Ehd1WWEVGj9czZpDEQ5q3ljj4j7cDTc6iZa3MlWTIEd3
	FjEf9WCbVKLJpP2PHUBQkYQk5EITuTUpqx1lSOiHwFcbcjxb7Agsw79Xv6TGKGBc4irE6hqxnAx
	zAZ/cs0R5PDjeGChpKeDoARtYYW8L+YtNAetLfKYVr2x2CNmJ51u0vDS5dt2kWpwIpJ7+f+oz74
	g+ZoZtW6e5ShKSo7jPBcj3WJ1zjsRupiUOCHIeohOQBNUaWwbY+NgGsc8h/e1BmOgq7NIQ900d5
	Lzgs+LQa/Y0AN3EFW2GEE3KU4P44lke2ydlron4hk1RYb7mYEjEHyLPonhuorXFEw9H8=
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr407107101cf.3.1764593741006;
        Mon, 01 Dec 2025 04:55:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmjj0MqTTdL7Sg51Iv8ThAIsd2fTvcywFmFZkGgrzSN/jzajCzDAtkVxmT1U936hxOLJRBSQ==
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr407106831cf.3.1764593740545;
        Mon, 01 Dec 2025 04:55:40 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90c93sm12300309a12.9.2025.12.01.04.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:55:40 -0800 (PST)
Message-ID: <0d63bddf-7a88-4c59-8ba3-6655e7a8854e@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:55:38 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: labibb is not used on
 OnePlus 6/6T
To: Casey Connolly <casey.connolly@linaro.org>, david@ixit.cz,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251130-oneplus-labibb-v1-1-bb3653e43120@ixit.cz>
 <3fcfc5b8-7509-4e4c-a1cd-e973d7e1d091@oss.qualcomm.com>
 <f86267ee-ad70-43ef-8e48-b9f2e509c193@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f86267ee-ad70-43ef-8e48-b9f2e509c193@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOurWeZb c=1 sm=1 tr=0 ts=692d904e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=4_HY7mAHSgI59XXtPg4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 0YDum02YHK4ggrvqL6rYsbIkqduVG-Hm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwNSBTYWx0ZWRfXwxm0zLsJlK6V
 spjcBp3PSeeB74vbnSiECljUlIPxYr9ocxoX8jbnQFzTd+8Crf2CuGPH+94a8A8JvHLf4FDxV76
 OgTrYgLh4nYu/Tq64uTZWpTcIZMXXvmtdWyOoT2fjadnxI3gAHM9/ir6/nEQFJXoRmDDap9fTWH
 vw2zIWPUMdBBQEUp+QkoPDZlIWv9o9wmS/PXba+9TPjdt3F6ElEKs03S2GnlL/gUqGnNs2Mex6F
 7JjE5u/cBCLMUZs1NaVqcEXz8vOn1vunljf3M/ehhFUmOv8WvME9/plTLuuKOVNLPt1bZ1bQx/F
 ojOHexy1W4Nv/QHJZmWW7sgx3MZ8mWvUrLZZesXlEkh42xSDmhXiqIAckGufFzoZKYxlCZ5D8CY
 XZnZc6I4ghMk/rc+jP6BEnPTPLdU9g==
X-Proofpoint-ORIG-GUID: 0YDum02YHK4ggrvqL6rYsbIkqduVG-Hm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010105

On 12/1/25 1:50 PM, Casey Connolly wrote:
> 
> 
> On 01/12/2025 13:48, Konrad Dybcio wrote:
>> On 11/30/25 1:08 AM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> The lab and ibb regulators aren't used here. Disable them.
>>>
>>> Removes following warnings:
>>> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/lab
>>> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/ibb
>>
>> These are only vaguely related, as there's nothing to be wary about that's
>> specific to these devices - it's just devlink being grumpy
>>
>>> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>> I assume this is right approach, as OLEDs on both devices are driven by
>>> different regulators.
>>>
>>> Question is, if should be labibb nodes enabled by default?
>>
>> They're onboard. I'd rather keep them predictably parked than left in
>> whatever (potentially ON) state the bootloader may leave them at
> 
> Shouldn't they be default disabled in the pmic dtsi and only enabled on
> the devices that actually use them? Many SDM845 devices with OLED panels
> don't use these regulators.

As I said, I wouldn't be surprised if they were enabled by the bootloader
as part of some reference/common routine and left hanging. Linux will
switch them off if they're never used and I'm fairly sure the users won't
mind the odd couple dozen bytes of runtime kernel memory usage (which if
we go that route probably balance out with the added couple characters for
status=disabled in the resulting DTB)

Konrad
