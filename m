Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDF4287265
	for <phone-devel@vger.kernel.org>; Tue,  2 Dec 2025 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764671683; cv=none; b=o+8SMY3cvDiACHwS5Azhdgrr0dylro8vhSXOeaqwoi7V07cLlGnm8rpeiMCSv3NRUVPn1P08xRe2/f20JclNm0OoWm8EAaXn6MHdxxSj7FZwvSHqZHqYW6i7wHDKOezvdELQV5l8kKmD79uwORbgOil9ODv4gEif55lHQMcjj8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764671683; c=relaxed/simple;
	bh=2ztJRKEjPsFOBiCMUzA5yxs6O1Ci0q7iQmlOjEfa1vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRx1aFUqqqoTXM5Bj3csXt6fhm5OZ0pWt6o/DttKJKNbl3SU8az4jWF7pfj879RRXcE7BUzcjRcu3Zoa4eqtMZHlxte2SzIOEBvpjQl0fXMY5SRmd0xHhGT+rjHHBH+NmOTxlX7atJwnv7wxrqBe5cwY63+kZNJzDHyTOVexvNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaygTCbN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBY+1Y8k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaygTCbN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBY+1Y8k"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2675ZK2821251
	for <phone-devel@vger.kernel.org>; Tue, 2 Dec 2025 10:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ns/BAG/AgNn9hRwprKtdE4MKokUoNvYm4+HLDAP1hwc=; b=PaygTCbNftEZH2/C
	8hc5jI1tvnN2CZY65Em1CJBVf5IsRMja1aW3x4shwsTOwy7VxKSEK2NJYu9cZd6J
	kFxh1jdHxkvN6WyF1deE76+qskGXxu74+OJ3ncATBvuYqHUX2lA8G8JFa0JcpgNO
	3t3RuocOyOAU0lDUBUo6YIJor15CRABNXbQj+BpiSuSCFGPQqKIWb8eE5qkvjxcz
	2ng3n20JLrsPMe0YHmYXrfquSusSLy+MDu0r9wzYaF15orXWrLDeigeMkucokj3Z
	iZFVienGpKBfdTGrHjUlgENhcpuyH7290VwS+Lspi34mY7yEn29tSJx+dwip3c8l
	NH4zeg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4astjggu4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 02 Dec 2025 10:34:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ede0bd2154so17863271cf.1
        for <phone-devel@vger.kernel.org>; Tue, 02 Dec 2025 02:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764671681; x=1765276481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ns/BAG/AgNn9hRwprKtdE4MKokUoNvYm4+HLDAP1hwc=;
        b=KBY+1Y8kLuCvN/JRKJBsZJba/Yf8DtrgSfugRfWyJthtu3kf1TEeqK1Uz4FdRsbEE8
         g2jXzKzxiMOQv0fYjocDNlxJSZFGNWgr9Z6o+PxA6KOospHtCTOvh5h/fhY1No2mBHMR
         2SOqJvxdAL8fdfnK34DpZyswtsRTRuYo61/mcxwFScCCWs2DdVNKgn7F7ZOrhnkAKJYC
         8zbj8ZbHJJlv71KcVenUXG36Wfq59hT3h+Jkf+G0i/rAU/0fddaPgl4nsXWJbfw5XQZi
         IzP/JQr8rrk6xkOyNBxqZMg/IFJ5DV/Bv6vN888D9GH0ernun52F7lBDHQFqQjVMK9yv
         ZQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764671681; x=1765276481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ns/BAG/AgNn9hRwprKtdE4MKokUoNvYm4+HLDAP1hwc=;
        b=U+sv3Qpk9cD/V3TNPfHL2xud/AsycX0M0iJQZQ4w0DEduFzSzUg6wY9fylXuYQQIaS
         HidlGk+oGKBvonvZvDGz01KGfHtg4fruXLW6dJ3L/p0PCgp3dKJj1beadU41SRisarzZ
         mC6u8TxG91OOg9mjHuYy7QAAvA+KNcr2IL162aM9Dz3Q8ieHz2Gzg/QoIYYR3dCVCnNZ
         +KQKRTNNctsdJptzhBxwc6+99xHxID4xfabYE5usZ8E5PPdPVAS1BfmPjYBCQi7FAsw5
         ZKIiBph3eytcCw/bMA2A6ug8xMNhQeuylBiniBlRXyxt/cynBC96vpQVIUymMIWro1tF
         /PKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIjTtdHs4cei91YsFGOTJOPmlFwzK8Fumm+0MAjwdISccT+8T7x9owrKF48TT/XYfOm6ldzCwnfDZB+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7lzJOu7lMRicUDN7ilBK97BIfYle7RX3srmqSmax0Tmb+AEv
	0at2YS1un5ZYnxDufYJzkYfSodiYOHRThoQrkR8jlpHYjG6aduufUrANCd+qef+5IrNd4LJHKEO
	aB5mau/bQSODIxE3LYAyCalNLvj96JNOhnL20BC4Kv8rrUxHkFl8wSqk3gvmlkJMlJQ==
X-Gm-Gg: ASbGncs+G3x0i9Bpxkltt0oP0I6TJVjdcHoFS0yThwo3d7sgKGSc5YdUy2QadczYwiw
	Imr84OK9L8C2Qvml4UF294Y7UUBizzOT7gJjnoA78l4BUYeTeA1cOMLZgmtRapsj3DWTkxaZMA3
	b97oDPHNhj5RHy1EN3iZ8NJsLS50N4N9TufqSO+sbAdUM/NCIRMmeZi1uCY2TKcolj0VgOKz66B
	1mJUYhZRzQ6TeK80YJ4wPBELujuRm2y8KidE5u2fs9oo7avZeloAqwub5ADEAltUiIInIaSmJiS
	xwu3cz5y6mXQyXdk+wRPIDapxVoOPiYCfYM7hbtLsJA0b7l8LRKn/OIeqasBcniZTr/Ng6fmZhR
	xEqUTZkjJpk8KpcQwr0S92+nsFnue1fHYUO7eSnWvmN99JMiqHwasCaKRCNSSPo58LY4=
X-Received: by 2002:a05:620a:178e:b0:8b1:a4dd:3d66 with SMTP id af79cd13be357-8b33d1bda9bmr4527921685a.1.1764671680560;
        Tue, 02 Dec 2025 02:34:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtdAvgcyk7QRADW1hbpG4fH4I7s35wRaJ15/XdFB2WECW4xko76K04Y/pmT2WF/84KTMGU+w==
X-Received: by 2002:a05:620a:178e:b0:8b1:a4dd:3d66 with SMTP id af79cd13be357-8b33d1bda9bmr4527918885a.1.1764671680075;
        Tue, 02 Dec 2025 02:34:40 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647509896d1sm15589587a12.0.2025.12.02.02.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 02:34:39 -0800 (PST)
Message-ID: <1d56eccf-1978-43c2-afcf-03ca88acc0e2@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 11:34:37 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: sdm845-lg-common: remove
 framebuffer reserved-mem
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
 <20251125-judyln-dts-v4-12-a5a60500b267@postmarketos.org>
 <adcac270-3668-4b17-b430-d67ef311dd7c@oss.qualcomm.com>
 <803c48742755394d6eabc34ac73a42b36615cc01@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <803c48742755394d6eabc34ac73a42b36615cc01@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UQmQ-571HHYfuAIb1rpD9vSNOg6ulZ7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4NCBTYWx0ZWRfX0vDYPuvw2yyL
 aWyLh7M7IiQLA1IhtW3OKvw3IHfo1o2VJGBqOMjtV/LR1KUoEU9/sZ3OdP2oyikKUEgdTlKpQ5y
 VO9sl5zR0f7ciK69BPDuXRE1MaiXHYrTsj5xpeV76a7g6W+thTGdW/yFQPi6GSlHaI3Z1Nh9sCp
 R8yPeiJBBgQ1S0AsfH339Kd9d+fF9dKupieHl/Gj9a8YBRhQubADCqLOZu+yf/i9Njv9ycMUdt+
 RbrmxRJhZWQgq1EOiXIzYTf4NW9ToDlfwElh2uZ6PRy1qMhj2A2WtEe0j9IkB8BqDhdu+3YGbpO
 No8vfYOeIWvpLVoAXU7Ngi0GQiJSJ4dT8EhcCr+NDllYNtZ3c11Y7kDw5ULgaQmOdOjR+PrmZgN
 nXXVnmiS0kZ9zeRmcTDtEJgsXSdToQ==
X-Proofpoint-GUID: UQmQ-571HHYfuAIb1rpD9vSNOg6ulZ7q
X-Authority-Analysis: v=2.4 cv=EbfFgfmC c=1 sm=1 tr=0 ts=692ec0c1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Gbw9aFdXAAAA:8
 a=HGklCxIUAearZTKdR70A:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020084

On 12/2/25 5:41 AM, Paul Sajna wrote:
> December 1, 2025 at 12:41 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
> 
>>
>> On 11/25/25 9:12 AM, Paul Sajna wrote:
>>
>>>
>>> It causes this warning
>>>  
>>>  [ 0.000000] OF: reserved mem: OVERLAP DETECTED!
>>>  framebuffer@9d400000 mailto:framebuffer@9d400000 
>>>  (0x000000009d400000--0x000000009f800000) overlaps with
>>>  memory@9d400000 mailto:memory@9d400000  (0x000000009d400000--0x000000009f800000)
>>>  
>>>  Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>>>  ---
>>>
>> It's defined for both devices that include this dtsi.. perhaps you
>> could remove it from there
>>
>> Konrad
>>
> 
> I don't have a judyp to test with and prefer to limit scope.

This is a mechanical change

Konrad
