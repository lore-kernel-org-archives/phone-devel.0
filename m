Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05CA19F41C
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062823; cv=none; b=RIzoQ6+Ciz398bHYZMJRs+OikXrgTC+Yye4UfC9yDwp1ri0t+4yYtgV+C2jsoou5rqx2a+CgQKVMfv/0zRWkV06Zxzr1PSdm+TJugR5vTsjrgNWb37SOkAYKdJBv8rrddz/sDDzEJ4rzBO+sJqkJ0gnDItFalih6uqoWpX+vLaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062823; c=relaxed/simple;
	bh=VhMH2nygLaTG7mc/nW//k6R9Kfgy0BdrogZyfC03hPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e/Vt+rYEocdh932U+5FTgXfmQqN5Uq4kZ63UsVu6/0QkC84J1No1oeEowCbu0YDVUxsKkv27wOWSBNEw4nHocNcdUXf80S2n53sN3SPta6CRHv7F9RQvZCnn4A8Fe46Tl+dC9y0iXI/xlpbPAlixbr2B562radSmLSQnrfV0g1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8zQu5Tt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8zQu5Tt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S8hnGT015919
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 11:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DF4cChWUCVUfCwvnacvCOrX60QCJzf28MqWHnByY88E=; b=A8zQu5TtMCn6TfmQ
	wnVhTiTE+5JkVeV/UPhTR7IvX7/hYP2auLIeYUe6akEr9f1oLEwsoMvAN6Y9TI3g
	6O+/LxfrMH8gfUb17BraQR1rYSdPxFDc+/jfRjoGzmkAFTbNGz7lpbU0o70OV/an
	pWrK6JbXQF2xjNACP5G3DcWDY4cAI63BvMVFof0dmFSkhU7ulXHpJNXgoPoYaVn9
	uusgP3fdIwXqtIwhZdCPxKCTphopWr6fa4tpmIqAvktaA9V6/jSoD73iDf9DT9OG
	DfPTuBLCSVM0iEOycarLHphnuJyvwvDObd2WTgqTQdaBT4W67PNI6LPDKVoQZBo1
	MV+7yA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44euyq8b0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 11:13:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b704c982eeso132635985a.1
        for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 03:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738062819; x=1738667619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DF4cChWUCVUfCwvnacvCOrX60QCJzf28MqWHnByY88E=;
        b=G20lHtOaS1FZmCFylkjlE2vDauuUp5Yga5p5rXUhMOsp9Zf+is7pw3rJO5nFV75Ygl
         KXWu8VMe2lggYex45hBxBaQT7yVGnpr1dTx7P5Ld01fB/WOgUcRKoIqES673y61hmbEY
         YW7/hBH7h2m59W6DzL7Ni+V3mCuPx4LJl1vzP7I0HIcWdPCouKnTv6Hx0Ub0hBzIITja
         L1hH7hqqKN46NIa/5OhstYsut/VEQR2Z615qQjNcFbzTnV7LIfkKwQRE25kIOQTkSiC2
         FRgpEF84lEvAbOdns5eXueF8/aqcC4v6qSb5e35c4zZiYHTwe+0se9ZG/PqSLJNO/u2R
         +nuA==
X-Forwarded-Encrypted: i=1; AJvYcCX5PgoWZWg8ipGSCpJQHuuZXIKr9QW+ghHgwK8qqaVN7U+LTRQy3706YALfVy6tIJODntVssZCUUKXSDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/MH9ZWLQjYgCdTZ7nujv6uIEW3RHIMI5eAi0Vce0Aa1j1r3xv
	rTM5TkHuu3a/eB9o2QVW6NpyD1FyQ6BbEYmLLwFYTaFkQ8lx7JzJC1JDAs334p5vJJ80yn+Zy13
	w/Yl3eH9kqf7I6R0azU0IFxxB/Uirx4LD5IoNMcDBGWkaJqN8ff4i18ch+LTBTdpY3Sg+TA==
X-Gm-Gg: ASbGncs+m30yoEIjnpYkSurNzqxKIyo/SkqQoitiAVJru2a0QFVUpAhVuU7vvDsghXe
	LQ8efd9loitJkhhkgtGDDlAwDgCS5xntMqd3ZPxdHs0kwzaVVXnh7kTyDO+parCWnxzZo4X909G
	r8rlqqNRuwH25b2YJ64/vRzTZ9MuwzyBXbOpbTMqt9OKM7GTPo4H1zZgW2nP+R6O6T5cQWne4Q6
	sPxNqeoM7ovecPb8K1NBAeNN3MX2l7ovBfnAqqUtt8uPM2iaQbAPKRxL9R/fRN5y2zlj2OPfgRP
	Qb0TDoBja+p03GiIUnThLOWQ652Min+PxZYP5k5rE8sw4J2Rlgvzen7u638=
X-Received: by 2002:a05:620a:43a4:b0:7b6:dc4e:44a5 with SMTP id af79cd13be357-7be8b2eb172mr1598261885a.5.1738062819161;
        Tue, 28 Jan 2025 03:13:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ1h7uf+LMhsXH4VhM6mHS1CLjA6Tpc20KWyM0RAcBNkCaIf1DJHDqGaYa5IelQE34WvcvZA==
X-Received: by 2002:a05:620a:43a4:b0:7b6:dc4e:44a5 with SMTP id af79cd13be357-7be8b2eb172mr1598259585a.5.1738062818767;
        Tue, 28 Jan 2025 03:13:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc1863af41sm7222946a12.44.2025.01.28.03.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:13:37 -0800 (PST)
Message-ID: <f3dd3500-d07c-4231-a0df-cb4812ee0bca@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:13:34 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] ARM: dts: qcom: Introduce dtsi for LTE-capable
 MSM8926
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-11-67e968787eef@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250127-msm8226-modem-v3-11-67e968787eef@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bB7gvBo7FPQOtpUGZkGCz1HqHAWdZ_DX
X-Proofpoint-GUID: bB7gvBo7FPQOtpUGZkGCz1HqHAWdZ_DX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280086

On 27.01.2025 11:45 PM, Luca Weiss wrote:
> MSM8926, while being 'just' an LTE-capable variant of MSM8226, the dts
> needs to slightly change since the modem doesn't use the ext-bhs-reg and
> needs mss-supply, therefore it gets a new compatible.
> 
> Since we already have two -common.dtsi files which are used on both
> APQ8026/MSM8226 and MSM8926 devices, change the setup a bit by removing
> the SoC include from those and requiring the device dts to pick the
> correct one.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
