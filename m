Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0325F315D58
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764930765; cv=none; b=KT5mT7ifHyjRc9yb/OeRqTISt0ibNYjak4MmQktvSGMRy/iDURof0V2EGn6HgVZC0FftczRFrdgILZ4iaEMY3XN7raPn1zaViqXTndHieXgQnNLif8I+LcxsD0S7TDyjGljrTUajceZgbi3qomc3TztR3rsmT0AHWAobs0e5TfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764930765; c=relaxed/simple;
	bh=zqEa1Phm2YFivtYudYmDMsH0UzPdMx3PFBOBUcA7u6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOutmO1JfOxdKcj2baU32x6PKiWd2V2Xh6EwGnO0lDvm9iw0q7CCxxkmo4ufJ0+yXmTggAMVbC8eYO6CpdpMeHiscVaZp3Ji2vWSukNDk5/PM5mBioDNxT84uo4YQZDD13pGGTIvc7tDB3vDafqh27sAPNs0CCx/o8IYNU7+NrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T58MDTRx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qy9DDZN1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T58MDTRx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qy9DDZN1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B58rTk72896646
	for <phone-devel@vger.kernel.org>; Fri, 5 Dec 2025 10:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Md0HLaKA7v+7E4ybe8neyg7zFOaTJSlN0VpctE2sIUs=; b=T58MDTRx6XtNVEpS
	j9e4DaHhO34PEIHwPFMQc/cE1gU7Mb8atYdefQb8hJ9vPlK2vJ4m2hZWkAUfwgQC
	0q97VMjTN93N2HtkYnyS9W9eW5hH+wXFjwkToqLlvym59wM32yAy+jZnZcuxdeyi
	rbdsgXf6eJrC7GYkIv1CpHtQf81tvCA8sSphOT+MXFwB/HvN+AK3sAm7lQSbxbpq
	gmdAutYO2D7SxaxyU41YcPvfKctr7wzlxrbHl+a3RjR4aF1mbyIqDE/l/Gde3NDY
	xeVd3vkv17a+tKLnx4P/MhlSnu6SjSOUwT2bvuGj2tKESy3T37R7ffIoHFtsNMtd
	qMFIyw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aukmj1n7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 10:32:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaa289e0dso6677761cf.3
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 02:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764930754; x=1765535554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Md0HLaKA7v+7E4ybe8neyg7zFOaTJSlN0VpctE2sIUs=;
        b=Qy9DDZN1uRoJCkfJB/3RLGQA7ZiLnlRwdFE7g/KMZeuNdHliiqvMZxd0vDQvjewITa
         rXs7Ymt9h2IfvjGT+G+tdvAc6Xwpcy+cOYGs6seFrkUQFuSkEDvjqvojlfBR0IYdZqjU
         MxSyzBn8i+AV7cVtVDqgql50s7coQfGSXcCJKgQvAa1oXYKpY6PURURdaqBDY1ndOq4F
         EiRCJfYrNrV0mbIrAaacT39aem7fZ5nKRKe75S2M5pWEreZgiqC73aYQhwqsFX1ruDH+
         BR/mioj3/E1Wb2tnUkv095aEui39bUTjx9L/DIcPNivWrjx1UAeztvigC+i9X1ljvhDE
         EXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764930754; x=1765535554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Md0HLaKA7v+7E4ybe8neyg7zFOaTJSlN0VpctE2sIUs=;
        b=iu+5bxOuWbpG2UFR/+ux1cY2f/At3OuNIynv/P5cuKmtd+UNrPVl6ZlLsBulBojk8A
         AodPH5nva5hYtVohFkDmWZkq4l1b8IZl/vPCGcQEwab0UhHW4hFDXzp7kVcfb5AMHyH1
         YJ9Wrl0wCD5I2Xquhyabs8yLCt+lqi0SRENs2IAcPAeJHA8NAUcD2wWJj4aL887C7GrA
         Q62054OMdSaJwDtltdjib8wNFjrwIAfQ19Bu7PxZKLxJRMwbHYeY7KdnZ6Ob08Qr6GkB
         3d463jiwS4KtPL19SrdWA058C7QqQ4wyUa1TL0TUZ6g9kR0LmjudK8nOFqjRxxNFK1mD
         yPxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyEpqv8awoAqj8txkeZl7d3PfCY8EyvAhDgSfhQGyADlBrb1Porhw4pt0zrx/CJSWswtj0yCfrRd8kvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq0YSGzErLNcBZSecLKogJ/4bsEC3WzJbToJCmyMqtrzKCKl5A
	8HJyzf4+MZiEyD3uVjT6wkFGNk1tAR/iZPP0BLGHsDzV7c+gKZ9xS+c7GWYibchfe0EHh0Huf27
	F2TX0catDHwNb+ZBnDMBGW/s4ydoDrXk0tL4bq+Pb4CXaydVwPNbmX/XyJIdIJjcw+A==
X-Gm-Gg: ASbGncuE5P8slZR+e2D1KW0kdPbUD27CNp4wNBX+dDsO7XRi2UooWeDsmFgfinHcovr
	hCiRWKmLDa73QYsZeCpw5n+OD2UIwObsulJIN1mfjk9ocgc1X/cv9cC8nN6sl8P3ATdU+v7w/bX
	5U1H+DZmdfub2RyO6kDpmgO1Ouk2atXlbsEbbjhxvmyfZ2csI7KznEbS1zvhodJjNMUFMY91vt/
	QjFETi+kxY651SmmNtAQr7czF1LfSHzXhdbFbpQntiqhTS7FyP/yVZ5xmWgfqfMGEyIHbqndM9g
	0RLWt4Vjv60c8YAzRpmlEIAHqY/G5fT6rflvXH7UNktrlprcFiWw4jL9Tfw45NRjKVlIjizzftx
	jf4T1DDuVuEqKo84OX78Mmk7HZP4hxO8OmKP8vK+A7cgesf2z9o7/l2OkMXBloYtXzQ==
X-Received: by 2002:ac8:5f91:0:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f01b14c0e8mr85907051cf.5.1764930754348;
        Fri, 05 Dec 2025 02:32:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxNbLfXF6Hv33bMHtXMT8E0wn88Sbiojkg1+G1AysByZB4Mfk/jeHRzS4+KmLPaRHLnUeNsg==
X-Received: by 2002:ac8:5f91:0:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f01b14c0e8mr85906871cf.5.1764930753918;
        Fri, 05 Dec 2025 02:32:33 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b368de06sm3491412a12.22.2025.12.05.02.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:32:32 -0800 (PST)
Message-ID: <8ab2b4ea-6148-41e7-b700-559d34817a44@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 11:32:30 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
 <62ce91326c0e1d5aef1ad5ecad9b99695f983347@postmarketos.org>
 <863db415-51e0-4c54-85bf-ac6a168758e0@oss.qualcomm.com>
 <9cdccbb5a3fb10a2d7de1e1d17d36018f40b18a1@postmarketos.org>
 <d8a3a30a-d627-4085-bab0-b73a2eeaa12b@oss.qualcomm.com>
 <2b03a898bf57cc87b78e3a90b210ed3d3f832efb@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2b03a898bf57cc87b78e3a90b210ed3d3f832efb@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bYtmkePB c=1 sm=1 tr=0 ts=6932b4c3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=57xSM-M1QwdSUQZNnfcA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: o2MH3xibFBqNJ29XrlrWR2JrlimKBHBE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3NyBTYWx0ZWRfX8zAiE5aqyrPs
 8O8sXl3Q5RfBjM62tzR+ban56fOqLhGI8b+kXQqY6xPLZXSDH17ry7/8bBySBh7jXp5p6KoVh5c
 J2X984taov46GyI0aDGpJp3EMAzdsNiUljmHoqxkuB7Beitn/G+S6ecj0iAVlVLu1c/RxJAr2TW
 5kbTvTpHz/pqRKxy49XWWBI7mIHixk9wmEdWRugHKuB3BFNsZBHeDY5iL8EJL6ZaH1ubuoD1YGh
 48bQlwiVNTBBAKBPsJv9ASa50Ww0KFgZVaK93NoGtJyHNCLXZsOsnWgH0R4Rr1XCXa+ETYf1tsV
 k/wEwK+EmNQfn8Rw2rnh9vbwxkMeUKxJU6tmVIor1mXeRK82VmCClMzenzCsKSU0P73CeRQVIQj
 HLdAk9AREF1D5OKr41hiiDdwCENB8Q==
X-Proofpoint-GUID: o2MH3xibFBqNJ29XrlrWR2JrlimKBHBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050077

On 12/4/25 7:37 PM, Paul Sajna wrote:
> December 4, 2025 at 9:17 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
>> led-sources is parsed into a bitmap and written into REG_MODULE_EN,
>> this doesn't translate into anything that's userspace-visible
>>
>> That would instead be the case if you defined a pair of LEDs under
>> the device node (which is valid if there's two separate ones, such
>> as for some phones with a back and front LED flash)
>>
>> Konrad
>>
> 
> so it should be led-sources = <1 2> or something? Under a single node?

Eh of course what I said is wrong, it does indeed parse it, but in the
end it's a !!mask (if any enabled, enable the module)

but for your purposes, try "led-sources = <0>, <1>;" under a single node
that you have right now - the count also matters and it may just resolve
the presumably-overcurrent issue

Konrad
