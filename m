Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7C425F995
	for <phone-devel@vger.kernel.org>; Mon,  6 Oct 2025 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739811; cv=none; b=Df5Z++Gncf0aO7MulbA/j3hcL4++jb2TKB8mRLXltyhtWzNYHGEyKpOQ37KuXArQk87ppKkbcydkBVjU+kh4qzfytziqzAASAlh9JDwDV3cVfPOM642aZqWKaL0f8mQBKNB8Nm18DdjSlIj4HllUmK+/NPYNrkeqczqF+bb4S8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739811; c=relaxed/simple;
	bh=3xJ7Z8oCc7s7mq9s3oXcMYfek0obhqDRgFqn5utKAjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qaI+MiopLDDSOA6DZpxNA+YoSNrDY1kFZ/GP8LTT/rV7ITpqpxWZMoKvhAIHbEEEK3WngBv+B+TWi1UaNOxchB+iDKudcl492GevoaDrgNUISeDEP1x42jPmbePeiCW0plWz+SFvASd653GEZeYjhPRH/HqGZWeyZ8h/afwQztI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7uz1c01; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7uz1c01"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5961cm8g029291
	for <phone-devel@vger.kernel.org>; Mon, 6 Oct 2025 08:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8346oKcNdc8O5mk8XD1GS+ABgJlZ0Nmd9Pq2hDG+C9c=; b=n7uz1c01dD2fH1S1
	n7QQoxOfLUV2LDSHj+OsVEEc4xzrT1Z3I51Zi2sX7NvvfS0C+pFqv7lX3ZWlvTYw
	x9/KoaKsv+o5C7OyNNODNzW2uzBCWYhiS2jGtvn9Y7K3BWnn3PUn3y/79QB+KDxN
	Kh1cMI37rtCU0SQebLkv0FihWCnhTxEor1re2o0rkNUR5gl0mLb2WGFm3n5ims8I
	XBH36nuFqrOk2wYnG5h7mdsgmXCIbIpbIpQ5yBkO27oRdh7PaDcKA1ZCMpvTk6JI
	WLgjYy6hE9qBwSCasgFFL3O9rNKzV+WOhCVYD5BauemCZg606+E1d31xxfAxFBGe
	bYLESw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9duhgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 06 Oct 2025 08:36:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85db8cb38ccso141238185a.0
        for <phone-devel@vger.kernel.org>; Mon, 06 Oct 2025 01:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759739807; x=1760344607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8346oKcNdc8O5mk8XD1GS+ABgJlZ0Nmd9Pq2hDG+C9c=;
        b=aOjNPCKNvkMHxLXc23pBK0S/+aNzPFuH5JU5GL3UYchmqlP6ac/Xkgvt42j+3zzg4c
         4bEk7DN5Goq49Y11E/4UH9ofrOa38KbHcGfq2zeR/pWXAnxIFW70zshiOpPclql8oh4v
         sq2aF51a7+t78cjdRySJGagdWCKuLQWHDw2+NDdHfuFAynbbo6XAicio5o0Nu9jxe1+8
         PsJg/uIDqeDuagWXMCPU9Ztdu3nCcNSxxzExgmY+afBpBb6g5uoDUkiak5cjBskLRes+
         QeiHmjj8qw2QnXiUZ+XPOPcPZHuqX1lwfR5CY9CujeV4IWf2D/ZSiQxcRgFasf4jaYK+
         VzYg==
X-Forwarded-Encrypted: i=1; AJvYcCVzI8tVbIxz09XaQJh3/OIhINtQODUjK9k8Hx9GwqDvwtQsxiqdJEKoeaJRaZJqoUAl/0jnrjZwqlSkOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOivYXpQmxS0fl2mHyybooJ1wnn0Skz2TSevqoefLiju4JYtBs
	dowt4UomCg8RIQKIG6kGgwqUJsCE4p6Cj/Ym77k41hTaCCk56BfUTMIIaCplJ5iG7ktf0Xl5Uyc
	+5mwxGjTj/JmnVhtTix23Pmq55OEhRCCsTyGohopv6/YUIcHJOw2qlWJZkiRyfQohxOWp3JDPtg
	==
X-Gm-Gg: ASbGncvdaU568TSjifBGbcNoGhtmPLTUd/5l+xYfwmWw0W5LvTkcEsR1ow5Xm3v8QGn
	JdCnlB2iIiW6xGKmGvrQkAApEGR0HwSkN3lHL9cj/HMc7BRytlVgaBrQjPJlkz53NyK5/maM+Y/
	i3v3yb5vXui84ZUu9Eukl4Vs7xC36d1JBmLVJ22J1fy81Hhatt1k3YbcVUA434SLq3m2Rt8xE8V
	yaenpmEQoutrLFcfmWwuE79fe90l5S85nw/8kKAv175z8qSzh6/P5jKY1ESa3HMKqD7gldBOYBO
	qUK73+ID+kLpumhtMO1YetlCJ+dzxMj4KB0YqDr3qw1HEF0SI5HVHXXnCX+LRNjv7H7HmbNHf+u
	TTSimlRT8j5dZX1quyguF6gGmBfM=
X-Received: by 2002:a05:620a:45ac:b0:815:9dcd:986b with SMTP id af79cd13be357-87a346d149amr1024823885a.6.1759739806814;
        Mon, 06 Oct 2025 01:36:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPrqe0FEK5A2rK0WqG2bUVqVAbMyKAAgMNM0yWU0D/lPD6AGWyTfFRy3QhqVeiDkZA8LrxUg==
X-Received: by 2002:a05:620a:45ac:b0:815:9dcd:986b with SMTP id af79cd13be357-87a346d149amr1024821985a.6.1759739806366;
        Mon, 06 Oct 2025 01:36:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b2basm1094364466b.51.2025.10.06.01.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 01:36:45 -0700 (PDT)
Message-ID: <c7639504-e605-4dcc-90c6-4993ada0e271@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:36:43 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-10-b14cf9e9a928@postmarketos.org>
 <38c70e06-f7bf-4ca6-8fe9-2a4012017cff@oss.qualcomm.com>
 <64a732cdc3fe9381e2f716be9e965fbc905c1416@postmarketos.org>
 <sarhhzxs77gthpap3vsxidvut2bihtmtyjecjbo7dgvglwfd6s@yt2w4on4f5zw>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <sarhhzxs77gthpap3vsxidvut2bihtmtyjecjbo7dgvglwfd6s@yt2w4on4f5zw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e37fa0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=ruIub6WMR363QC8emKcA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 8EX5d9_YfEVhwf0YGpDHuT4u4MIPsMqM
X-Proofpoint-ORIG-GUID: 8EX5d9_YfEVhwf0YGpDHuT4u4MIPsMqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX7K8SYUDsgbpw
 amryclKeT2f0BANrGQZgFcTbp2s2v3crVzsn3tFfwWjnuaSVa2HIxiLplkiRulixTlpvtizwQww
 4gWQV0OT/j3JWboabN6XfvmgR34E/BipLtLrY+ZchhTsyq19f1oFlZn+rGK4fi2GFnPDvyOyWTU
 FHWEa7TJ1azLWJJdBUyudYg/M+EMx8mTbJUQQq98l9mPau0Lnc1E2iLoULfCbVdKA+DiZBb7BeX
 nQVfBO21qCvhRL2nnoOSHls7lmCT/KOUvRV5pP7hc5DrAOXIRvhFdQim3/jl0mGJVVej5ZM5w/Y
 SUJC48mKAfkyfMtQtmpr2YHlztmQg+csIG3eT1O6IaAxDI3knIVDs9InPj+M2aipm7t9QLzI3Qr
 kfUrcVS3xxr/n/BY+0MIXo7UFbgSVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On 10/3/25 11:55 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 02, 2025 at 04:55:44AM +0000, Paul Sajna wrote:
>> October 1, 2025 at 9:09 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
>>
>>
>>>
>>> On 9/29/25 7:05 AM, Paul Sajna wrote:
>>>
>>>>
>>> This patch will allow any values between 4.6 V and 6.0 V to
>>> be set on your phone, with the kernel defaulting to 4.6 V at
>>> boot and staying there until (if?) any driver requests that to
>>> change.
>>>
>>> Your panel probably expects a *very* specific pair of voltages
>>> and any deviation may cause unpredictable consequences, including
>>> magic smoke if you happen to go over a certain limit.
>>>
>>> You should most likely hardcode that specific expected voltage here
>>
>> These are the values used in downstream android dts 
>> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/efa8458f79dffeb380d43b38b9403407f87d9f05/arch/arm64/boot/dts/qcom/pmi8998.dtsi#L484-L485
> 
> Downstream frequently further constraints the regulators. Could you
> please check the boards's dts file and the drivers (SDE)?

Or you can read back the values at runtime.. presumably even
/sys/kernel/debug/regulator/foo should have the up-to-date info

Konrad
