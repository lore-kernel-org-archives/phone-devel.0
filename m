Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F47E36AB76
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835786; cv=none; b=aV6Ht2nVwIWWCK1fX4vpEZgufBp2cXdAempKx6vSF60JfBhAk+YZYwBegtMqSMNk/03O6ZDwLFkRPQ9fVSmtAGHcNYvsjnJFM3JxajCHih4Z4TO++FP5WeHfA4XUuAESkqS617xCG3xOj4zKTl1Nn+oDiSzXtL2Se3LGNsNCUjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835786; c=relaxed/simple;
	bh=MasSu6LrX5lPgNjrXNQ4hDcLWXBWHEq2tH9/laGLU2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/+B7v3irb5vFU4dKC0SdEanMWsneEnk/cAiyM64gkQEXhbfXSzieYwF1CpwcOTwuCIWleXtiwzoWrfy+GafjcLPN3CaWywJSnp4gPLMd0YbgCsDW/Z4JwYpRE6suG5bnER/4jxfYyrVN1W7Al5DXauupljbUBIqJIctwbW/EcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N81CMaN1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNufPPMi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N81CMaN1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNufPPMi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9N3nI3358710
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 12:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PHXU7+o+q6TQfOmo9FWcPNUGxEdG3zDnyw8T7/zKsc=; b=N81CMaN1MU+ZxPW5
	C8Xe6kBgG+huzIe9651hcdfMEN6KBbk9eTZaHIL4iglggKQA7mA2EaggnQTgMD8Y
	TPlfvFceRpBcKh9V/dO8Fdix7OIv1MLtwlxjBBNFLF2/qFE69WQguPYLQXbq0IiK
	FUuWasjVu6dJMnVXPwi1Xss6mCbeHC/ltO60RRkvpbcULK+2dKVjMSZS9j0u6UUH
	EPrDzl/GMBd/96L53+8KeXKi04JUmhSxhNsr9AywCpnz45rIljusJ8hCSkwFwp8Q
	50Q+NSc8UpaDItT/P0ABcFhck7VlTekw/kbGeKs3tkplYPKlw/1lUhD7xOMtwhWk
	4i9Wbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb0jua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 12:09:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5073ed1ec6fso51236841cf.1
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 05:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773835784; x=1774440584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PHXU7+o+q6TQfOmo9FWcPNUGxEdG3zDnyw8T7/zKsc=;
        b=XNufPPMi9EDOjpXfKcMUliELbRM5b3ydYVXO5cBOH9efhUsaaMKLtKl4fruEMvCFrg
         SODOMUKSP2V8Jv9xTDWEhFF/VyNGUpW7iQjmlge4wCptGvMoI6A0FFjDNRUq5gGq23Ms
         Ifbra/YNKQrh4kevSlWolJsWWFcGbkYFoMAa4s9MTgZ2QGdfMWJl07ap1ei8HEdEV8WE
         I6iUXqrvdIcGU6ai75rCm9HAR7WnqsleFh1z7UFijJ/q+UKk1tdQvLgi3KgXFErPiop+
         V1yahOhRSogYm1dVMLft8xYEDBw5aT1XWcUZuC9qeXzo6sEkYDzGLBOCC+VYZBgq5RNH
         jWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773835784; x=1774440584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PHXU7+o+q6TQfOmo9FWcPNUGxEdG3zDnyw8T7/zKsc=;
        b=LCwD7s76Vp6j3kFrZFNPiMJWHZpDuABQR9aMqRYAnoiwKTp10DeZl0F0Py1/qMItXY
         u6b6K7vIsHjnwOTByRZt5on2GOD36PBWneOyZj4uJvgZ7dskiEYUeAGMGkhsJDEPSYVz
         DJYjmlLsnleeU6PUV+IkiEQPXAvbwTdrpffMIGhCoezxS4q5cboW2pZ4s16y9AEw9kVM
         P/ciz9yvsy584fdWQlcKhSYsM+OcTg79jq2s9fyX2mN85F7zE0734QgpshXQqzwDfGK1
         IW3SCJ2wsIbp8DEV+4xnrdZ9da779dkX5/hoPMySh81tKGRV5aRwY1HjCyKu7mq4o1vg
         s2kA==
X-Forwarded-Encrypted: i=1; AJvYcCVTMcE6h8VrVHXPRQFF8U8yEbGJ+Ibyo7OsWc6RJ4vGE14iI2dtQj1UEE/p8yX22zX7YOSQ8E56SlWA7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YypGrVGjfqHWhyk2xorfiG0qrHb6CSMVOyD9HNLkiXpgKE5x8Q8
	aO+N2eJrSMkRD6epFaKBnz6VenD8msDufJxuJEqP8pgJ9iWuDAPgCu1cl6S3dK3sptdVX79lqja
	s55BT21Bc3DVi32mp8nB0+Mh2Nmyu8vNKoOavrqKAZz6N1UrjmUn3N1FhyUtuVrkZGw==
X-Gm-Gg: ATEYQzxRW3xsQ9jfE6geeFYp2DSMnGXxe8jdhRHrNcoeVjPFQ5Oe20S8jjAuf9Yjg9Q
	Xat+37KXJxsv//kufdl4vLP6WwouicwxM0JNdpciikP3N7ZquCQyyCol99x0lbuuGYA0CSXmFQH
	9fO486HITIcAvmH3tLFNDx0RTz55oiRjfH7zQUUtvLwvND7BEOLsHw0NommDIzPkuZnVkEpIHsu
	79o6Nfzs3gVDCJQ9lJm/fAMAwzzegchoBeFuGr1Ol2OPuFqhwambT311hZBb4gDPPm/GkNS/CT+
	WcvCRFrQbBukmdcILW8SJgf+fpgCMIggNC/PriGY9Hos1qM3zXyzQ2N0BtdHF6G8L330khb5x6n
	ZPlI8Y44jkbrNlYv8vqdOz3LzSistflCuTarWfCm3qPwCI9xXqia9Dk5gPIZi+pBicOExcw/guH
	isiC0=
X-Received: by 2002:a05:622a:34c:b0:509:9d9:e19c with SMTP id d75a77b69052e-50b147690e5mr27514381cf.1.1773835783597;
        Wed, 18 Mar 2026 05:09:43 -0700 (PDT)
X-Received: by 2002:a05:622a:34c:b0:509:9d9:e19c with SMTP id d75a77b69052e-50b147690e5mr27513831cf.1.1773835782975;
        Wed, 18 Mar 2026 05:09:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16ddd39sm190290366b.43.2026.03.18.05.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 05:09:42 -0700 (PDT)
Message-ID: <74c7e115-2a64-48ab-9fc6-14efcd46717f@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 13:09:39 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl
 nodes by pins
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
 <20260313-fp5-s5kjn1-v1-1-fa4f1c727318@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-fp5-s5kjn1-v1-1-fa4f1c727318@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C3CokweOVI2mXenjnZUiZtQjoR8I68qk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEwMiBTYWx0ZWRfX06+kQVf1ygeV
 pWjqGUGeHoVMZHFzNLl7HAvppoQEa0jmMSEfZH7UKu2dO+u3SM4X+ZEMA18wTTjsIUXw8rE2xb3
 y1Q03VeB52uUsUSIqMg37SB8vdI9t1mts+dYGyJTBfXdDpiuniHyfI8WlU6Lw1LFXqI4GYldRCF
 7/QWcd6wTlXCvAuLbPbROp8279+BO6ySCYzJV6ZtPvXxuGnWAZ+ynOF0LNGft5RuuoudMAawzsz
 3+ZLynbkMCMG45EAYJICJ5wYgDet72Lgno85NrNGgTI99zJZshmzlz5pz4fnKM53/nRZJt6RT+q
 fNtpUjS+nAImFDjbsA93rXiX+PMdLQNmykLF7IlM4z9aW9+/i3j7GZobls5pzyJ8awVFz0Jan/X
 KImq6QNapGOHcWRcyxy+GM2Gk8c0HA/fuhIw9JOcbghfjkvriGF75hA1hWDcJK0WbUjJUdDIuIV
 TxCmMCxOxqpD9Ow9MEw==
X-Proofpoint-GUID: C3CokweOVI2mXenjnZUiZtQjoR8I68qk
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69ba9608 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=x2qkw7L4rmU9F7zQ9u4A:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180102

On 3/13/26 5:00 PM, Luca Weiss wrote:
> As per DTS Coding Style, sort pinctrl subnodes by the "pins" property,
> in preparation to add more pinctrl states.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
