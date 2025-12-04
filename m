Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C010633033B
	for <phone-devel@vger.kernel.org>; Thu,  4 Dec 2025 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764840184; cv=none; b=QcpyIRWGMexamjlsPXgHVPA3KTjCDu7HQYWuF6HNsz86bfg8AQCg9ItSgU+cgVKCVETNsLxKdAK8UX+MdA08G6yEVsBO8ZxsK5IwrtXUmXBoCP1pwH1pa+XTdYq0O8nCJrhnbj0FWxrX/8IYkDyfR71DrZ96mDK3AfTpLloQz4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764840184; c=relaxed/simple;
	bh=VZP/EdnogDgQSuo/KxEFLumMit2pZlS0799GKaySjb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgwx+eu+zzRy62qwMfAeJA49n7VuueZD/zVhjnQ5nRpzPDaC7sYxOeFg8hWIuPqSe9QCzH2qHoNzO1fGgXPeYltQSr+SmvXc7y9TKKwRtQ2G3IRXBoLpv5I8+f4YW7x5YLa2OUP6SO97i2079bDeYgDQ1Nf6BDUdFt0x8Qni01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rt2nfq/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNCYbwdz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rt2nfq/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gNCYbwdz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B469ACV552035
	for <phone-devel@vger.kernel.org>; Thu, 4 Dec 2025 09:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PbJuffjjECzEQUtSUUJ2livpSj+kS9JttgPgzKgWsCI=; b=Rt2nfq/ArclKvYYf
	uOX2Wp42x2cBx9hWm+GdIqZN2koFRNPshuK2g5U8apjnzwBcyE7wqTlVTvtDshXs
	Hu5ZxCKips6iKv68VqMWB6smsGY9NsWYqHqGu36qE8JfBG7cenmPgPO4deH1rIeL
	Qce7O7O5aoQrMXNJ1F/CxGoX8a4hLtiRTxtz2KFN680uG0Zkb2t9QgVqm63f8v8f
	KDeuaH4kfn0wZG2fIQYCrmJSPhgeHSDNo2zgrO0v7IA6XUVmyX3d4QGGsq6H9mgz
	mJqMGlTOBQFVXAoG/0zjh0lPTSCIw7hGAM2C5C823Q231utMnRR4qQv4BcLS0vEa
	up9JLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmdbf3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 04 Dec 2025 09:23:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f0252a852dso1300561cf.3
        for <phone-devel@vger.kernel.org>; Thu, 04 Dec 2025 01:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764840181; x=1765444981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PbJuffjjECzEQUtSUUJ2livpSj+kS9JttgPgzKgWsCI=;
        b=gNCYbwdz/YVOjfHJ02Lkp4wwHSu+IxjhBLn2e0OOaeiE2YxRtmRg+H8zJDK8yIPnq/
         qtFRSBraexhJsFvnMQH8PVutn8RSjk9Xf75lbW+17FjAlOtCLQ7zfk0CIJcWlWZHf9kk
         bVRjH1pbVSxKcQchqnEuOd3Q49r/jjmBoJx94g080/kQHp8ibofKhxvkBPmvBTColcOB
         9RT9UFjC8feF56qsNVjN2AohdbFuCNF7YT41OaAEQgts0itGp9lWFRY4HYITV9nFnE76
         Mdyo2CHNkJpTJil6ap/sEa3hVngOiR1KB5ae79yhprRZUc0NB/qSqYwEsgnME1EEQ/ZC
         a/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764840181; x=1765444981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbJuffjjECzEQUtSUUJ2livpSj+kS9JttgPgzKgWsCI=;
        b=sxVjhxLURdsT8J6UgiMx3JLLNCjSLD2e7Jdg7wiiyhJgpPfQY78r4oxFb/pASB0xKq
         5Hzugi5B+yqY4o/WGV073j4s9p1DPd7Z+apLIAyPZ/Dawv5bM2f92uAI9q2bfsg2aIUC
         2FtaBO8ez5MSrCzqe9cZTlmxStmp7wa0tme5+/1sahuhQ9NnwltrTvQwnjckiLl94q/b
         WzUurQcjeZiavmVlcnqTn+UyBtGRpbBf2vJnIMPrUKai+/TeEjUIXg7nAh9EeQbgWYbp
         abOLlhg5mLaAAdsMbn/p9KJLVH6aMLoS94OmrTEgN5beeqqfWvzUZau2MbDYA0exy3Xf
         siMg==
X-Forwarded-Encrypted: i=1; AJvYcCVJLIURp9VMRaWWopP7USL18ULI7oMse08GOlTFAarsFO3Ci7/WD4p/sk/2IeBMQt4H2jcNrlaOsgTiJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhwNZTbPZN6OjdaUkVV9bAHj9itaPSgnlo9mAz4D6f+r73K+d1
	fnms+jGLwzCricJBe1wo4fQug2c5FszYsOqvp76l6er/UBkhcqEO1HL+G25ixTb8A5sv4AmHS0F
	WAAWrF5sQpMnNerrCYbHfnXGm3iO69k4zOFHG0SMXJKSCszVX7jMMAz5d8k0i6qNYLQ==
X-Gm-Gg: ASbGnctzSNXwCBterx1POsZYDn5UYB+R859mrQlSD74JjC9G9ZVxb3TKJUUnay9WrjS
	fpkARXupUbICi/2+2wMSFRL/LE7TRpMcNT22Ogl+3DMwWo3qxNAq6gApEP648eFpo+GK6popCws
	Bhvv0u95hT/jOoux75/IGDJDaurjSLWIgXf77yI4vEIApvMS8ixOXNA1ZeD+GaGRk1e1rxY5oRg
	/0K2zIAd1P7Abnh3yKMHtgUly0m+e21LIXvMD4sIK3t7kCbbRlaGrvt0JRN6qAxRASMoZzh5L2f
	yHmzqQzMjCHoDCyCxaKLGKVZihh4E+zmcYPk5xeMoPP1MxzZHm/QUIdXp+aQKY3oiyyUJH2eSI4
	X+9wPQV97gEfzGPTaf2bxE6phZaibVjTrFyb7AJk2dr7tn95wJKixyXAQdhMKy32u1g==
X-Received: by 2002:a05:622a:4f:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4f017610a9fmr59876321cf.8.1764840180933;
        Thu, 04 Dec 2025 01:23:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIlr+rjoR9RCyBnaNgLjnEL59Zitz7P2P28pzu0H335alGScS11NKS/dVqLgaVEpKVynLy7g==
X-Received: by 2002:a05:622a:4f:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4f017610a9fmr59876241cf.8.1764840180496;
        Thu, 04 Dec 2025 01:23:00 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4a2f19dsm79869166b.64.2025.12.04.01.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:22:59 -0800 (PST)
Message-ID: <7c4c591e-a3fb-4a3f-8a5f-901fec65c548@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:22:58 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/12] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self'
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-11-80c1ffca8487@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251203-judyln-dts-v5-11-80c1ffca8487@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 31ZlUXuOLW2paZ2Y6b8AEI5AGQDf5WSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NiBTYWx0ZWRfX+dFlWKMjqe9S
 14ZTwldtfPW8JnmydR1f7Z8yeHyBUYB7VdlqHeljyi46bYtML0kc0DZGOmBaBLhHSmJTpiSw372
 6E/5CAUtbkB0xUxA/G9ciVCwUVcuPeZb+OpKqa/PxDt+pOi1gzMjPA2XDiDynZryKRZLPGVxOuS
 IVw6V8QTplT6hPE4rnXRMVPmeU0CFEelxzAzO7IihaTF+OdO2miURffutfc06RvLOp6boX102HZ
 0lrUF8f2KV2zASXbCUQ5GmWHUq80drFFogYYGxegTr6ksIcjkDpHLnHsY7c6un3Xg8CUspfs4y/
 hyM4+vBHQQUQb2XBXrgOQZQ4yMK09B9JuJQWvTkhuasdB6YHQLUFZ/7KAF8QUOrW2WbL8LyL1sw
 /kc58ZgaRFe/TTnJmqh8L5EaCal2xQ==
X-Proofpoint-ORIG-GUID: 31ZlUXuOLW2paZ2Y6b8AEI5AGQDf5WSV
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=693152f5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=r0gwGleY-OzFdj7W7YcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040076

On 12/3/25 10:41 AM, Paul Sajna wrote:
> This lets modem get a bit closer to working
> 
> ipa 1e40000.ipa: channel 4 limited to 256 TREs
> ipa 1e40000.ipa: IPA driver initialized
> ipa 1e40000.ipa: received modem starting event
> ipa 1e40000.ipa: received modem running event
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

"The modem firmware for this device doesn't preload the IPA firmware
and requires the OS handles that instead. Set qcom,gsi-loader = "self"
to reflect that."

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
