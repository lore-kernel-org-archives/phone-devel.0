Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305CD4B95C7
	for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057657; cv=none; b=g8ySn0SzjUidbBhPUKuaEQ3ji67XDN4zzaBObtpiOOF+/0jxiVT7+RfbggZeDkXzqXf9eyRV77g2BSrrApw/+M/cVrpzh/I75cDe74bIh43t+8B/OkbCG4zJ3M1Nk3lEdVS48CqqGrXJC1ymKKFNIX3ny0iP6hH0YOewv1poIPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057657; c=relaxed/simple;
	bh=cBfxVIv9Gfg/4VI6OyYAvENJXNbIZlvGU84iWNLFcBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h81SuLpuLdyLmn150fo1VT5Yu5TIhIMytX8+Mykfdy+ttOKHqotUGaltaD/V6xQ744eslyAH9jPMDShF09wyvuZJBerBWZy/Q2PprxJukwzmF7kgzrkPBBGm4fgAwCUk8J2LCNEaGanyHc4iWd+Jr47Hzeqs7w4bkoXx7rXf+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2mJtIUb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gku8Fsfe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2mJtIUb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gku8Fsfe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSmo2662626
	for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 09:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDU8TX1cEApR2Xu9eH0Ex4ReuufIE4RNU3D+Qgb3MnA=; b=f2mJtIUbpKj/k22e
	6MtZiIbTEHSKwK1yH97k7b/APUhS9eExs5HnAcSAE5S2dIkVTfPuf8Q8yIYUZE1Q
	16eo9u42TEycFCvjXvVSgLaKHCDmtf2lZLkBA9/UXp7M5oSqXruMOYHQtwS0ioIJ
	3klfO7c3tIV+vI8plFpGu+IqwLxTpFFKid39J/YF1D7KlQFiIctia4eTB+Pf4sHB
	psWZncyxGdb1eQA4e8iI2oCDKdrCqupCR2tilrHsuMpERVzGanP8l6CIkbcWWn0B
	XeVFvqDuCEiri0/mIQTfwzYkqVQnobc8T0i9P/aa6QhnVppiXiS32/pXx4+GMqwU
	3/K1BA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1cmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 09:47:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530cd3dff25so10562131cf.0
        for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792057654; x=1792662454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDU8TX1cEApR2Xu9eH0Ex4ReuufIE4RNU3D+Qgb3MnA=;
        b=gku8Fsfe6Ts+A2jU9avH7BGM8Y4XV7v3eF3/wOVslPHEOzw79KulctRXk1PqpeWNph
         aiy8paMjQI1F/CfTHxZcYIKZVlXsKp//jRYvoB1rnWcc5oSXB8aFwgJFFE+MeunloR41
         MxIh1L2XLiIdlD3fvy9cJKsWVffdV1CkynvU9T/Y5kGLIvxxBmIkzdiyh7mpLqD06t/c
         lRU1XamhGhMmcX2QeX1+L8+iv6kKa4yGzGgknf0ZPgMhcZa34f5driMt+dWzoQGUFdpl
         Hws3JJuVCzT5MjJokM9lDfdnoAIwHvGemQNloPVlIs81nFrCTv8ZdUw5iErQVnC6mIEo
         CJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057654; x=1792662454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDU8TX1cEApR2Xu9eH0Ex4ReuufIE4RNU3D+Qgb3MnA=;
        b=qLVPvjoSopM45qjnx5/75Q0Kfc0r5IQy2iJCYtyHwogTzer8JzDz5gsLnq9LCJGPV5
         AI+On5PqDOoyehZdAGo2Ry8enOz5P9wOULSGD06M3Txj1ES3fGV3QJxi4gKgJjNwR7yf
         qY0uUAa1NTSYQT3k0Hn3jsZuuLwI463fQdHrthzfob7F0D9og0ureGT+9pXBTTWah625
         esqYNBBsXcCee8QpLFENjc/DIb3JN7IB4AlqtO19Bnj9IlkX4rypH5W0QavpFY0rvE4j
         iPBamaYFprljeIzEddBELD7YWUZicAxPxDhJMp1TdBnOW4fzyPXqf119mn95W1XBbqh2
         9tcw==
X-Forwarded-Encrypted: i=1; AKwUvBwawnwkF0YCNLQeyxkuJa9S9V1xnOSC4jvh4OJEF5eX71vGtrUUuei0ekf74IU4w82ymt6oAz0f8yebXQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJuTCU3Hw9U8hAz34Ji70pZhkVnSm3r6ZQ1iL+GjLyvDaPrAqGM
	m53/+k5RZlqlXqjYuFp9HMZraH7s0YNby3SRRY1jjENA/eKCgHeQ9N4SPzHgHcOK1+Se8+kWp13
	2skM5KRLHUAyl3HM0QsJtDHpiNVEBiIKJmHwU8yepX+dcgd3SSrTfUm3d+5A81FPI2w==
X-Gm-Gg: AYBFou2y6aCaQkkUT573+nu3jLkI7A9rhFdBVSVF12x2ROX1mr5ftSVdhDJB2A4Xrmz
	3midFMtSMuDNTVVq/FNJ2avPn6sqcZdPmZScpkqJ1FJhu92q2WUVNfKl8EGt0eBT4LE4gag218u
	YepnRWNbwZhUXOVSUM9wAdHoPtYWoILSnvSnEOcqP+/wc50GDy+BXoaHqpj6JSkYS6WhiwuEQDR
	0AloQ4me64FQoMMEuHaW/ERkVDhXpiKiKAFGUxY/V13HrdDzms5oUpLkKtk6nKgT5sUyHD07Iv7
	tQN0xf5Df6br1UF1Cr4fFgP7fB8sugIZR31m0yihRXw2oSShOYo28WO3kK+m7C3ZkAZOFFrnqyJ
	9E7grzQjkHZ1WByUcPG/igw==
X-Received: by 2002:ac8:59c6:0:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5359f6a0984mr344359331cf.2.1792057654502;
        Thu, 15 Oct 2026 02:47:34 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5359f6a0984mr344359091cf.2.1792057654008;
        Thu, 15 Oct 2026 02:47:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3f0a6sm103745766b.43.2026.10.15.02.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:47:32 -0700 (PDT)
Message-ID: <1a7d0385-db7c-4c44-9f26-74afa62c9109@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:47:31 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: add Xiaomi Mi 8 (dipper)
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260915-dipper-v2-0-cbade54919ee@ixit.cz>
 <20260915-dipper-v2-2-cbade54919ee@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dipper-v2-2-cbade54919ee@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX4IwT0DzMfiKG
 MdS0W1lzJDqYZm87KzZM9Aqgjs7rnk82jClEAX/m+TsTwtr/Ppm75gaaut5F2oHxyEATPqEKTHN
 OxRlFlBkjZCThACYSswbsZWO1GM0QZE=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0a137 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ThNut50O2AIRvfgEoHQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: D1BmbEQhjIER8aGlgVeAH78tfID6bpOU
X-Proofpoint-ORIG-GUID: D1BmbEQhjIER8aGlgVeAH78tfID6bpOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX80jV7iIk23Ak
 k71RW36uTG51I6mr0fWL8Am9Rd0Gxs1BoeLfjyM2SbyCxsV3cM3CXjPVvEa+nnaH/YxFTc2MIiS
 js0ekyD0fTeMk2xHY5BpCuviKxS6Qo8SOt/nu50mXIvldR7kbC5512agKgINU2tDfHAjtGgKJ00
 Y9DJUxTBsm9ZleGR/OppBySwOQULb0ZOyH9Bsmhx7zBfnDdecoW9mYrv+FKJ21tp0X+Ylp580uN
 acQ49SRfU6p8X7gpn2P7F8QA55eFevu2LpymFqKKU8mNsypDc/3g/RHr/U/12vjG8DnIh2yOdU2
 BBFSfdFPpnI/flIVFd8ezfaXDBPZFDUuFtDFHuVloJWsvoQxNvE7ys1ZLRL+JMK1uWWr2Yt/q4X
 qWWK/rj0FDROmMkqOYKtYASyM48cUK/o/B9dFach3r5C2rqCiR04z7Xi1AzCBhTj92RKoqUyskX
 uZX58z883ZfS1dbfm+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150038

On 9/15/26 4:32 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Initial submission for one member of the prime Xiaomi Mi 8 family.
> Mi 8 Pro (equuleus) and Mi 8 Explorer (ursa) are nearly identical.

[...]

> + * Xiaomi Mi 8 family common device tree source.
> + * Covers Mi 8 Explorer Edition (equuleus), Mi 8 (dipper), Mi 8 Pro (urza).

								"ursa"? ^
[...]

> +	reserved-memory {
> +		/*
> +		 * It seems like reserving the old rmtfs_mem region is
> +		 * also needed to prevent random crashes

Have you verified that with e.g. memtest=1?

> +		 */
> +		old-rmtfs@88f00000 {
> +			reg = <0 0x88f00000 0 0x200000>;

0 -> 0x0, please

[...]

> +&tlmm {
> +	gpio-reserved-ranges = < 0 4>, /* SPI (Goodix Fingerprint) */

drop the leading space inside the value

Konrad
