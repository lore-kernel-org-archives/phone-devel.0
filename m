Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C41B4BA9FA
	for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062739; cv=none; b=ZRAl4SU+9mQPHo88lm2ijhKgue9TepnlLiBKX4xRwLKz7LsP90RN/L0q4PS6l9hz4ACjNUZ/ZqVgw/waYOmEUEe96ErCwbZC7uIvf6584Qor5Psn0P8ZMesTszUZie2vvAOv3itvYZuq7n62OpCbVYc0A7o0IPV8Z759L0O1MJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062739; c=relaxed/simple;
	bh=sPjoF9f84PGyViRQPT82i/2szqbbsj93fMQFZd6Lxxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhZ42Lxai5ZXdRYyO+cINM4V/uTt3JGl9ZYjN39I+e7XvantJ8LxIi3W20Q8jiNS536zIi1Y5h8vawpdcE3eotO5D6yX9/mHu1NFG2W8srkm1XqllkeoceYKnuXz/0TDHLE5xts0IecxpbQIgLT73npHQ7dMUMiTRghyZP+HwpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k69FMqbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuK3ewpp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k69FMqbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuK3ewpp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jgvD3510187
	for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 11:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0DIyTEthEN3q9Ggj8PiUnymVMVI/txDYbRdKEeQRTo=; b=k69FMqbpxwlPuS4i
	/Kq5qjCRTI/ZlRsRuLDIBbWucTNTGRFtP7Jirl9iIvuMIA7UWihq2otaCsCSR1vo
	ZzRuzerWaljvI6AidhXloIvvNafzJFT6js7hmKFty0hGNG9UoM+ndMoZv3d5GvP/
	2WiAMBjFyljMEmb1MJ4o43aEhd8REWxzOtLwcSSHNa5ma/5wQ3XF5D0QboifWfyc
	jqx7vtMTUMGWPScCYzBtOGOBF/rxiYcfG3caK/gj+Gce7bq1C/ym2MlVg4GkyU/q
	NLdoEZ1xxhcFmkcrK8/PtodcgHRHCNIaGkF85mNSTXQnSfkX9VGKGN10ABX59Zh2
	lAaaLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9q9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 11:12:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so99720485a.0
        for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062736; x=1792667536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0DIyTEthEN3q9Ggj8PiUnymVMVI/txDYbRdKEeQRTo=;
        b=BuK3ewpp7Qfg9NcrzYjTt51NuOp5Bl5nr+fd55s2QXMArksaB2Laya/DuFapoKzyQj
         QYc7OsfigE6xgy03BOr6ModCUMOoaSqWbYzvNYXiCTFbXm6TfivYXatlEI6dy/pSkRSE
         XnpJ3vL8FgUw/aWGkB/nwoPXmfVLCFzje5DxxH1m9FLXFAfHB4KkCQhbOXvQ1aVOX7WZ
         HbYkCI8eYWBfgqDtvdSnLux5QgpmL3qBo4IjWeEhFoEzIG//lsJutJPQjm9yb30DuNFQ
         0YQm5B9Phjpr5w0+cie6YZsIGqlJ29FxHbyLsfRiN1plEwLAevMfM1L2d0Wh2DaQtf7N
         vrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062736; x=1792667536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0DIyTEthEN3q9Ggj8PiUnymVMVI/txDYbRdKEeQRTo=;
        b=w5JkrS8SiW/SMOeay+8bMETG6fYdxtEVDvXhIQbsBNTxqLF0cJEbFVaxFDn0woLcnH
         OwufSBNTY/C7/0GkJSDaLFshZFoAw4ZY+s98yGjf39z+dS3Xx6JiVkrjfHwX4qjNiTi3
         khF3+yE1FFpNi1M1QE8OKXA42wSnpZdwZit48IUShwjkBeyFUcQG3vXANGLAudyM/EN6
         lBUhFigWL0ci/Xo8Qj2RFHGG6v82OahajaN8vi62NJMHIRUbDWYwrCBIENTVoupfekFs
         ix+0OowZIy7XIbCGUCcqf8Algor4JKnMYEhmjHEt5/GlktQgCzpX9cz4/IDXfLupaQcR
         DNsA==
X-Forwarded-Encrypted: i=1; AKwUvBxzjDgZltw/2qW8zJQ108gqeVHO5H23nAbz7FSYrvsFVXSIBeCoh/eJRshRmGV8S0tcAC24s2H6r6vZlQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIe+nxY+kJWB9uuK7E4KFXnDZlh3hbaLDbts2HjGR4zwI9HRcFB
	rHplTftLtNy8QWRFry5kbTyVSQUwy4Hd2s66Rmh/CrjqCKItyJ4qMlJ70cvLeBW9QkbUhpquRGw
	/KnzbeXTfomEbZfsPKryEDyj+ybijev4xrbG+cdndtjgM49MaWck9cXLmP9mhMSB3xQ==
X-Gm-Gg: AYBFou3lEpshXvvjEgdMfgqilYn2kGyMuS5V9S44p36h7GyL1sLTSUd0ApD0M6QiZ0n
	POPM8sfOUaPIxbwiIwYnOe5JktTwtqkWaojFTSnNjiOCxG1GEjNU1YgxOP9flwmT7QsFsRKJGSh
	UZ21M3z6RAAOBXtOsBU295t9lIio9bheMVP7vjnVgR/3W6+zpdViLKmNJmaF9jPhFSFv/3FjYOB
	naVArIxn2yRix4MPoualcxsy8YqILDf6Bn4AZdqe+6sXgVLi5yZcmV8v+RfBOXJ0+Bi82FcKWBI
	obiFV2lFO9dIAP2pTo7mjSg425NXRdDycjj3JITFaiUKKHjY2LJH0urY0DPGxfk1DRknn6LVhB3
	6ZNpIidMJ0NJ3UjG1m2S1Xw==
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3530253685a.5.1792062736307;
        Thu, 15 Oct 2026 04:12:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3530246485a.5.1792062735683;
        Thu, 15 Oct 2026 04:12:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839ca1sm2453479a12.11.2026.10.15.04.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:12:14 -0700 (PDT)
Message-ID: <782ef805-fb3a-4fe7-87c6-ad6924027eed@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:12:09 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260925-pixel3-audio-v5-0-7ffb32c980bf@ixit.cz>
 <20260925-pixel3-audio-v5-6-7ffb32c980bf@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-pixel3-audio-v5-6-7ffb32c980bf@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qYimVOkdVYnu9Sn5laZfWyeInfSzmVom
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0b511 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=TeGvFkPWVxK0tiUNUioA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX4U9NVgXy5L9k
 tu75l8In2zhaODF5OtU35c1YveNnOijng7GYap0t4PAjwC6bQbgwpqFL2nZyxZ4rJTlCF5Ps3by
 ev2gxevsNk58GDZdsUVosVz3RKGCmANWOHco8mAoKVfrVC8lpa9+EKbl+BAO4fNjL9kAeCAsRB7
 /T4+byIkluz1W6Dok5knW7QKXGYC8e7kF0Lk850mfT6g4X/FQRMLoPqBB+XaZgR5zDqcEhwbOwh
 kkElNX5dCFAtz4kRVClVH8bR3AaH5pIzT4RNOLRUncFGdLvpz7yOvuwE1vHxHw99aCAIVLQU82O
 LK3tIQWaJOx5j6u+VAr7a+vFyRwuAlgzLZiAkSkzcY1GEtzPYQnkfRUdXKqkySS1JW72Xps1hzk
 SPHN3ssfKSl0G1KS/KSIFgDtEAnrlA5CS8qdAbXbGcNH4O9syVs6b+MrTojheDpgFOmfNCOHbtu
 4KVjcLRcqd27/k26N2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfXwkHPvf2dBR3x
 vT5Im1ayE4Xlfor+d3iUQXTQTfiD2AvMLI9O7PRb5Ny9DuTsuHFVZ+1DqKzJjTzNj5nSNK3hvd9
 QDYzm1L7AS/GzdcJmQsOIBt/U7ZQXi8=
X-Proofpoint-GUID: qYimVOkdVYnu9Sn5laZfWyeInfSzmVom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150044

On 9/25/26 5:28 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.
> 
> Inspired by commit from Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +&sound {
> +	compatible = "qcom,sdm845-sndcard";
> +	model = "Pixel 3";
> +	pinctrl-0 = <&quat_mi2s_active>, <&quat_mi2s_sd0_active>,
> +		    <&quat_mi2s_sd1_active>;
> +	pinctrl-names = "default";
> +
> +	/* mm[0-9]-dai-link nodes must be positioned first regardless of sorting */

This patch generally looks good minus this part. Will you be trying out
one of the suggestions that GPT gave you?

https://lore.kernel.org/linux-arm-msm/e4b32a40-4432-40c0-8e57-f5602c98f096@ixit.cz/

e.g.

"""
In the ASoC core: defer component routes until after 
soc_probe_link_components() finishes, next to where the card routes are added. 
That removes the dependency
     for every driver with cross-component routes. It is a small change, but it 
touches every card, so it needs a wide audience on alsa-devel.
"""

We've recently got some fresh wind on the DT linter, so house of cards
this may not live for long..

Konrad
