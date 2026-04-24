Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574413BBA12
	for <phone-devel@vger.kernel.org>; Fri, 24 Apr 2026 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030590; cv=none; b=HPwZsCowEsMJgCXtNwxiPrlWeuZbqTn1tTsRBn45X+uYL0r2r9/dkmsHIZj6aOOxvXzNYl6ihTZ94gu+WXy3h3fmOne8MmJH5gOHvDUA0OPAzUzf8tpjbZMNBjzzMG8dbCdl5ZNkU+7XsLZ0G+XqP4lLfF/wqAqh1xN43O7flNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030590; c=relaxed/simple;
	bh=kPMGUNNSmroYSsiqLoYTt4gz7zVsODQoZrsEYXDMkX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kC/gQI+3+ctuMSqYeBOTXQqAi2bCQZtfk7Qm5r2lobkDBxw30GiRIFUKMK2O1FNByReeG6W0WMen+T2hxqQOFssD54gknogzRVOLP+0OSCsBzaeddLw8U5qsIwLscdr3boXdjaRnxjlSfGLSpJmF7ZZh2uPBQZKahFW6GPWcNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLx4MBQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/Ngsdjp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLx4MBQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/Ngsdjp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7Hhne1888411
	for <phone-devel@vger.kernel.org>; Fri, 24 Apr 2026 11:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szb/C/NuDvGqRRu1u78P1sc9wQPhVPl5cH0BZflLHds=; b=OLx4MBQVZcIfvtqp
	EyXnMunn34PmO6FdZqwrOQ5eJ7VdohfMBqrt1DIAgMr2uE8R3t9hM7eaLq2z72eo
	YipG+oORIKgtnonaVXYLPwHnQX3/gaAImzkd8WBfO4S9Oq0M1/zeMi6pBgzWRqvY
	wj0oPjcg3Xle7KGsaJt+w+smHfOrNCWSKTMu1i4CA51wtbDO6x7DWl9jBeW3+hF8
	mcrSBlcOojvz1YkxZZWCh6e4sMZxg6xXe6z3XnF6M7i0Il2qdAw9u2SOT2dt6KRT
	hIEgI4TMaxO5QOruwTXU4tLt/KEddekZOcaugBsK/PDF2nTLE7mkOXePdNEpfPvW
	lV83gA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqp9dvcwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 24 Apr 2026 11:36:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e5d7f4b63so16417271cf.0
        for <phone-devel@vger.kernel.org>; Fri, 24 Apr 2026 04:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030588; x=1777635388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szb/C/NuDvGqRRu1u78P1sc9wQPhVPl5cH0BZflLHds=;
        b=T/NgsdjppkTMSp11a9U6JVNm4ynwClbtt+qmBTanaFnXqQizUrI7EaBBfkCZWhM2yC
         1rRH5fqrDEKMZ8qp77aCRIGt2HJ+BeY2I8flCVgAJPgObjsW6TymW+Qdsx/NPJo6Yde3
         pC/ZeGg/pqA5c5yhF5vCjjeKIzq9PjlsIC////+hKtTHQBE6b6NKYX9PCJH4+TQoxEMd
         9AmOctokE4pIF56on5KqBcWeOxOfJCiuB9TIAvr+2cHcBaM9SPtuRdxQW5PyNJtqG90N
         QxQWTNSI3kWaSsh3wgGSHsIqscdTFLViQYBnJ+wMCMiPNBzxT2OfciWMUQuuwa8ZNM0w
         /J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030588; x=1777635388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szb/C/NuDvGqRRu1u78P1sc9wQPhVPl5cH0BZflLHds=;
        b=PIZDkk7zE6S8lNwO6YIn9kd3EKwyXM3zfGb+rVp2uUYhZjJ58a8ekBxAAbC9v6H114
         e8ivJI0QjnS1r5/iFroluGpqPx2CGQ7nDsyus9hMFjXun+Nxh0oXWucNChM6hgiQCvH0
         xcNhz+H006SwKp509qcbeIgF2e2T67zavjogDt8JFIwaew3FNU5HJwaQPqoqLjusKFAp
         OFhumMkw22+D+sMyogw9Km+83+3v6HUR5Dyc9YQYWzdwvEBBuY2V4aMZodFaEMPxWtUi
         BYTV2uMEXPOCqpBHFsh9YEcMfTBUdnD4sT1eyBsScS6xohpdYp2JPpvkwWFA0sEWYdCE
         Qe4w==
X-Forwarded-Encrypted: i=1; AFNElJ+k4Lr8feT7yFGat9ijZsaUo7VHi5Ys0tivt/HUVdR14bsySahevvqNKWvPO1wj0h1w078uIdEVFzxpAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWGFv/qxYzNRLnvkG5k2hUOMohlRgfrotEe+SMEtpHTb7qxcLc
	wGEzuAJD6yw0sFON9EyTUnTfWh0AK03tRBzU5q6jdi+OXPqIBzeG7Q3lcq9Dq1Zqdekx94xMMoK
	BkUvlFK6o8TXLz8bjxkPcxzuRc3xtztwtfiQawYC26utYKNoTpDPAPJGpLgTGHD5BXg==
X-Gm-Gg: AeBDiesgYV5TtLeAx2Vakstg56MTZ5jdvMRucVa39CyzGS5K5DzyyKnzwToNTQ7Ahn1
	SegjC6jvQZ572rX0HTaCqysy3Y4TSPDRwogvCHJtOv0HzQoyGjWvNfoOlg/62BN22T9MsOdkEnA
	ZUYUk4lkGspqF3xvAJEmV2CAMvEQhAajjnymt7O6pGzLxU1icgEuEJbfeqSdXj8V1Qh+k8fZLR5
	5KqhMD+nQJ2ARkX0BfZi788zDPPmRriRVJ0zPq9ywpDea8vgicBPXgraDYdnIQ4vl6Sz+WcHIkN
	OPKRDx5HIVSYMZwc5FSXW1CdeoSBPEsILxT2AWkWhD6s+JCBHC6GGM9JWfj0E75VMsJZSiHRvAc
	LRhAcoCLb6R6rqAzDAXwQhel/upb13fXEOFTT+NaO2H/JQDELVg/jMV0tf0Cx2IDqNeRG/I5fjI
	w4ueCnlez5pkPW8Q==
X-Received: by 2002:a05:622a:1f88:b0:50f:bfe3:a04e with SMTP id d75a77b69052e-50fbfe3a765mr119513591cf.7.1777030587691;
        Fri, 24 Apr 2026 04:36:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1f88:b0:50f:bfe3:a04e with SMTP id d75a77b69052e-50fbfe3a765mr119513231cf.7.1777030587197;
        Fri, 24 Apr 2026 04:36:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe836sm4924815a12.3.2026.04.24.04.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:36:25 -0700 (PDT)
Message-ID: <cb1a8f75-2161-4273-8ee0-6d36058fb2f6@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:36:20 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/10] arm64: dts: qcom: msm8939: Add venus node
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <KV8KCGTrLcQnaBrdbcO-8yqIObRcqYTBQgEYv3TaeT9dT0e9phTPowW1fza6BV9LfqNc6ZORybdss4WGdvnUTA==@protonmail.internalid>
 <20260416-msm8939-venus-rfc-v1-4-a09fcf2c23df@gmail.com>
 <ac54d018-78e2-4f8d-97f5-3cfdb5151aa0@kernel.org>
 <717459db-479a-4a68-84d1-a718c8ba5a54@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <717459db-479a-4a68-84d1-a718c8ba5a54@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MRNT1vbPX-rWNjlCDRbC1eJzJ5s78hnc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMSBTYWx0ZWRfX85xGb1dX2s1Q
 Y+agTzR68ppW4krzeA+HaJ9JUkR/Oumlm4vAklnwNWbwsus0WScn5ZJQGUyea5Sqfz0d1NBgQh5
 grv3snVmHPKiIxizRD4LggOU6MFYuoUfdZlpXsyiS+rv+iveRYWfIYz0hzc++68Gozd31/zczGC
 Y49fs+Li0xZZB5QtVvKOBGTK1wHbDMarPB/9EFgI0TTC+NEYEdjLlGcJr1k1wP0tmSY03Q2mvR4
 HY/j0CZ0mZriC11nVObWnqkcQSVl55fIburaNbdoRwrF4HCmGCoyCUSxjjRc8+w8F856MZyTP+H
 P+P90hnhua6XQX+0GnOs+hj0v7zPNkuZbSv/aWm+dQj3Mvwg0FqAGCANijnJl67yCOl4jvT7IEN
 3xacCP/bPkZmw5mXKnpcvcuLPpXnQis0wiPfamRJd2nYUE2VqI4zziYU2/QE/oXYMkWakcj4LM4
 JpDwmU/3Bn03NPOCAQw==
X-Authority-Analysis: v=2.4 cv=fP4JG5ae c=1 sm=1 tr=0 ts=69eb55bc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bAtGagR5AAAA:20 a=KePjsaevwCBX4e1EH2wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: MRNT1vbPX-rWNjlCDRbC1eJzJ5s78hnc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240111

On 4/18/26 5:34 PM, Erikas Bitovtas wrote:
> 
> 
> On 4/16/26 5:31 PM, Bryan O'Donoghue wrote:
>> On 16/04/2026 14:43, Erikas Bitovtas wrote:
>>> +            video-decoder {
>>> +                compatible = "venus-decoder";
>>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>>> +                clock-names = "core0", "core1";
>>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>>> +                        <&gcc VENUS_CORE1_GDSC>;
>>
>> This doesn't make sense.
>>
>> You have two cores => assign one to encoder and the other to decoder.
>>
> 
> This way during decode only one of the cores gets powered up instead of
> both, resulting in power collapse fails.
> Core clocks and power domains can be moved into Venus node instead of
> sub-nodes, like this:
> venus: video-codec@1d00000 {
> 	compatible = "qcom,msm8939-venus";
> 	reg = <0x01d00000 0xff000>;
> 	interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> 	clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
> 		 <&gcc GCC_VENUS0_AHB_CLK>,
> 		 <&gcc GCC_VENUS0_AXI_CLK>,
> 		 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
> 		 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
> 	clock-names = "core",
> 		      "iface",
> 		      "bus",
> 		      "core0",
> 		      "core1";
> 	power-domains = <&gcc VENUS_GDSC>,
> 			<&gcc VENUS_C0RE0_GDSC>,
> 			<&gcc VENUS_CORE1_GDSC>;
> 	power-domain-names = "venus", "core0", "core1";
> };
> 
> And then they can be powered up regardless if the session is for
> encoding or decoding.
> My first question was actually about this - whether these cores should
> be powered up only decoding or for encoding as well. Bus configs
> downstream signify they are only for decoding:
> https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
> https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/Documentation/devicetree/bindings/media/video/msm-vidc.txt#L35
> Unfortunately, I couldn't test encoding on my device. It appears to be
> broken.

Do we know whether it works on msm8916? (+Stephan)

Konrad
