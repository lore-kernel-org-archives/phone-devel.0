Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1F7374A0A
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079544; cv=none; b=qm6rjx8cgPjXrm7Xne8O8BOF5KRHAew1qAXmhRVHUQUQn1qP0hHRb7hhRvm+A88wQFthIS3jPtHbBYLEUz0dlm3oFJxtLvxcbf6SJB5bsqpe6xDfeARJQSbwc1K390mZDRoo8ZR9gGrLDsEdQ6097etsU6k1I9taqBWB6FHo5hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079544; c=relaxed/simple;
	bh=jcgQSk0c1BkwN8IYKPV80uEI4CWqTwQjByoyKnPKPhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7fNRjuEFRXRHdFd7n1xd9tyYiv4x4lo3MhB16va1YXvWjP6xx2jK398evjtEByn6+rnkyLPR0J7Tqr1u8Z3TOOOVAcSXct8EanGUVYPdSxpUAQJ0k+EMqGBODJ+5zy5ogETrqNx5xkp5ii16JAEOsD5o4Rc5yA6wiT/Q0ktt7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoVh1E+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgvSNM45; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CoVh1E+y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgvSNM45"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hjaG530203
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 08:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1N8UA7WOGRwcku7bf60izdArVt4JWeIT8+sy0FsUlAE=; b=CoVh1E+yVLCZS8B0
	AIMWFld+J0lPVhHHBFdT3L6jBHiwoe8QpKNz2wY53wD13NTu0S/H3JQr81WL04Kc
	4+/vJFhyet3VhSDmLoNZ5IDU6puP3WVDOq1t4+DHrSiuKasX1TJf/Lab8SF6NZnQ
	/x/+lOPmGfnfk6/jdcy6+AiPxaQiSD26nEDeXiyXUW7sMTdihU4uG0c5teTnuhTC
	HWWYhsuDwUn5o0UgSXH33XJLW8FNBtRE+mF5zmp+n7D/TZXDmDTlbKEA1vDxFX6I
	CJcNFd5ldWPc3i7xOCZ0BiS4iWKiP9lj7EmGb0KbDuhypSKN0HUpOJsWwxkzFHCi
	Flfc0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2hen5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 08:19:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517afbeda8eso13352541cf.3
        for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 01:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079541; x=1781684341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1N8UA7WOGRwcku7bf60izdArVt4JWeIT8+sy0FsUlAE=;
        b=CgvSNM456H0wmNeaVFf4CO5D9WL4pHYD5SuU2Lz33SHJnQdpkhVKOfESCQf1MdoOct
         ANakM9xmypBw/qYLyir+YfqvKx7NcJLnDFhJ0fHPpLlWlwJa4iD9F8D8mcR6p1Wbpohw
         fIDk4iswMx9i7BqWJWbIupe88DQ1pSOMdjK9JVuorBEu5HNuNER6CYCL3d8gz3/knKzI
         OW+aZhhVRKJL2ICJktszb7S3nEsZZzmwjdkca5Otd3OCE9a+TBoVvYGoyl1rlmDbUqUs
         AGWuabMmryEcMY3I/w0RxxLhHuDzaMk31U0f58+Zx69NpiE/50DXL7Q1tLzLJJrrgx42
         L2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079541; x=1781684341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1N8UA7WOGRwcku7bf60izdArVt4JWeIT8+sy0FsUlAE=;
        b=iZDfp8puKHJ+yHNOcw8UnhCGTsufo1n54b2t8hDi/p0o/OQPmI1DRPqVxQ2CaV9BYs
         pKia68lTPPtKVTN6dLxsYdQhkPfkp4AFVFCATiVyaojihZk2Lg6D/FnL4lL6l6bRvHg7
         h2mh8PFRIkGABECD4xIHb9wae+jvtWOeyiZgx0O2nJF8EWjTdNtaAClnokt6G9iN2orX
         eHYzMtAYYl9hm56JwKj3t3lXL6hPEnqsLkA1jZXJKNXTcuqtbYN2t0kxzCx+6rBaXmE6
         /UZWbbgMXTB5CeohmrEk9A4WFXKz/h0Hlxv3jnVpWUdxEmXsMtu6ROHBaU+XpZj4rZpd
         QGIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cn/g15M9iNra8IpoOmfltRFVglH7GxsEYUUitcTcM3SzvHTiutbRwjyDsHK/dVCyIIM71RgpiLkzzxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzEBWWoUDTZ7kkQfAgDpPXhYT3H2owxmlIiCb9DG51UZUnuWKA
	66fSafweXfySheZq+4bHe1Z8tcX0+LilFEhv/u2hMhfTSrOyNpQZJ/9id+a60gt4rXFAoXbwH7l
	sxJvyvSIWj4mmzN1i/pRzpO9q/VeNBMrSGSiLE8hhfHs1iAct48s6FYiZ85g79Auo8A==
X-Gm-Gg: Acq92OHU2/DRGQqEGcoOyiv/lmTA0TkJW7JivONCf2jZwIOA6dN2PGosw/WQpldcLx9
	Nrtx64CtRqeC5DHlWs1A+s7PPhIsNPsUr9vYdk4GyNsxBeuRvtr8Izbc1Ocrij+SXndE8OtFbqM
	hi2s6SQ0hTJhMUx/Jf8lEE4sk++ecPW9VC0nu6j6+GR4ADHNX2t5gA4s236AVaYckhbdl0NUYRs
	lORl/KYq+chk9e06HfVF+18zV+mWVS+5XXJ3qN1zk4jPjCd+gYo+MJiRGdjL0iLgHZpLMHL/IOD
	1SrHq2zckGNgmqjSo8sa3+wh2Zcb8inu5uAqOgjgYF9jQGyfEWXiGoRK+qRPlDfqncOO9NNIgZB
	lz0CDFGt71koU0Fk2Ih9GJXFrj30x1MeQ89UuKZ/UCWU1LCW1udmkNYH5OQgP+zUSQsrG+rR+S/
	0D3x26i5gN6qiicfYKBWA=
X-Received: by 2002:a05:622a:2484:b0:516:e1d4:553f with SMTP id d75a77b69052e-51795c4fcf7mr369785331cf.36.1781079541317;
        Wed, 10 Jun 2026 01:19:01 -0700 (PDT)
X-Received: by 2002:a05:622a:2484:b0:516:e1d4:553f with SMTP id d75a77b69052e-51795c4fcf7mr369785131cf.36.1781079540949;
        Wed, 10 Jun 2026 01:19:00 -0700 (PDT)
Received: from [10.111.165.13] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd051facsm223943196d6.32.2026.06.10.01.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:19:00 -0700 (PDT)
Message-ID: <296e084c-184e-411d-9456-375933a9c16a@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:18:49 +0800
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
        Cory Keitz <ckeitz@amazon.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
 <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a291df6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=vggBfdFIAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=3LiCsYdCH7c6jQhj-zEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NyBTYWx0ZWRfX+w2JVYR1WGcY
 GK4OIixUH/9kbrG3oFHmyR8+lTAfAOuFaQj6yFgmdI1Ff+l+Y9ZRuLL4pZ4C/W3SHLga9PAFoPe
 iq91E8KYEBm68GTVcgAweGA0lQO+0gyCw/YdHI2i0a7PUhZm0ruDe5RdLm/UfE42gZBgNHAO2nL
 bhrfddhVdjr5zyAYRZdwDxVosXrhMlro+mBCeGO1tbb+9g9kQysMjRH06DCOsV4mOVBPLRFxaED
 2ZUo1N9zJoKkwWqL0UlP+3R19WFwgUDFGHIv4Ni9szyOBhlHpB7x1hCBbZ4uGRdqJ0OV3w2XdcJ
 c8mEAUWI2SUe9zKhyAkPvKvxQiDgdwHOVpoVL2L/lrgOzZHdoIgrDD5WrOpXKUS/nDB7MhNLUlN
 QvdM8syZoDMha+0yFVagpHnf6XEy2EMocDpuzuR36UsNbDp/31FG9P3pVPcSxfpMt7OsHKRM5/3
 CFf7dVREYr9MUiqUfnw==
X-Proofpoint-ORIG-GUID: xEwoWlsrYazTAZthqhq0Ef3blo1QyYE9
X-Proofpoint-GUID: xEwoWlsrYazTAZthqhq0Ef3blo1QyYE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1011 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100077



On 6/5/2026 9:14 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> So far, only D-PHY mode was supported, which uses even bits when enabling
> or masking lanes. For C-PHY configuration, the hardware instead requires
> using the odd bits.
> 
> Since there can be unrecognized configuration allow returning failure.
> 
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

There are two Reviewed-by tags from Bryan here.

Thanks,
Wenmeng


