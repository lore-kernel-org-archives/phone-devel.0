Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E2305E2E
	for <phone-devel@vger.kernel.org>; Fri, 28 Nov 2025 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764328520; cv=none; b=IHqKmKtN9tQi1BHGtDbrg8KAiy62EjQBv3xAMCRdxJpqETt+cTQzHUiIpRgyOMHuJzGUyHEGi6gW2+oG4P6jwEZBy6Ja9tmvhip0Zt0FS3Fn1dRrYsyEwbkGx6r3bd5VeSIAzKVv5GYXhVW91t12FgmOQOYupD71g0VT05CKdQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764328520; c=relaxed/simple;
	bh=n+ySxHnTwZYHhYXwznO2V02tjJhInxCd2qWIOf0WAac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgjTSElIf1o6PE6rvoiO+A5p5xqRrCiTVr2879weez3XLh9zKsQ9BEqCL1mJU6tF7TH1My2DAJ7MYU+upd8JLTEaRjqTeFyxBVzAqqTThcZfXBhrlHlo7nXeGfLlh0/+G1/YxQazJENlu0Kcm1CzVTOjQ0xMK/J2vZxJzegrDlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oleUNC5s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3tifx61; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oleUNC5s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3tifx61"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8OqbS3621309
	for <phone-devel@vger.kernel.org>; Fri, 28 Nov 2025 11:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VwSYvmJb2uVF8S1x7X/dLtsqgmdmL+jgbUCk0j93rhQ=; b=oleUNC5sh+/0NZGs
	IvH7hpiAnMZGUB6n9CrUWdpZcCTACge/6/Pps3OS09jTf8ojFyyageBC8k7a9Zun
	uRjuYK1p5HUr3a3iterZEgO+vCNr1LDtpi382wCb2HG1kLMD3dVjwLqeRNnWBfNS
	+y6yORYOxEGRSYfOMBPibNhez44IPHQ45u1uVlpULpzTA9tAI5IJ+/rn+CgQS+lg
	WeaDDEKW/ujzj/yAo9tPrbVe6LkVQYTsBvoWUsmqUGaRWTkd6ot/oT0E8kQO3OV1
	kfidE063OUi0koGoypIfp2ZdFcDmR1CJ5uHnkM11A2WhxieTEJ+UtxjHwK3kBrZ9
	UK55PA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjdb65p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 28 Nov 2025 11:15:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee409f1880so2410481cf.1
        for <phone-devel@vger.kernel.org>; Fri, 28 Nov 2025 03:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764328516; x=1764933316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwSYvmJb2uVF8S1x7X/dLtsqgmdmL+jgbUCk0j93rhQ=;
        b=I3tifx61T5kz8qZpB6Gml57Cwrw4SVKC23Ql7JLHWx/tJzpiIW7mRNolfkjJIDUzS3
         FMDCAOjhPCezpMHx1Swd6i4vS0hnV0Z6mJT993/m6g7Z/sG+fS6PZsm4LWVs+K2wUJUO
         Fb7DgdXV5ZuiVw0Vx6vk4DoT+2tFlgqYb79T+0kFTMtkZfeeY5NYSPBRcf/HdaRoSRkV
         qez1+HAKodkc1Hn+wvfbNJf+roa+3YWJPUxIYsj9V0uEhXt78Vepg554Cy2Vxyh9dYKr
         +FbdZiwbdDdeTqaXiKYKMDXNEhMFs3KQUVYDaZqRcmL1yDX7SoA+0leDXVqZbpxUMHiT
         8JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764328516; x=1764933316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwSYvmJb2uVF8S1x7X/dLtsqgmdmL+jgbUCk0j93rhQ=;
        b=ZJTRuqZEw8BaRBbRf6hpqijr4dtL9yDqVLE2IlpUaiWC0choxB9vJk0m8h0iA+hXFw
         VXRBHhr2A+O4SwSlNGTE/anR6fNhfASQRKh1JG6uZMaXFYQKALc6fpdl2Na+FKWpwGBd
         nqyXdmQHCENCAxvyxMjORGxXISA55FGcnKkitRfBYtIKTBdKZ85AHvCgD1QfS5+WV0EC
         1gLulrQsKKxL55dFSZsn0CFUTH7C2HV2vgRhfHyE6F9mFy8a3IMJ/9Xq+7hPkr18Zn2p
         F8C0TB3hG5Bv6/Z6XJGq16wh4y/GrzW2EXVHNQp81sHsdcSIzN/Z2yNnwz7qXQ3FDC71
         uUpg==
X-Forwarded-Encrypted: i=1; AJvYcCVxkMtgVc6ZZ4OHTjrAOm6HGu54BPZE/L9XEs1tm1JkE0xJc8N6A0xHUU/cXlYz0PvUAa35tkENyF412A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy83OoWTDii6osQvpHSnkDApLhD/HX+opZEwbQnoG+QiorpOav+
	0M5KkRGt4onax4xDd1bGUH5bac6BZz7pIwCWhUkRPmTaFJNYfA1vP2VuAs4fZAdzmpJ1ylkvJaN
	yBpZvfGqhdmPfW47TAxB2lBjWAlp+oafzS/+5gaLwlcodOcZsy8bWVwere4xhKyt2oQ==
X-Gm-Gg: ASbGncsgO92beazMCjE5i/LeB6VxWVZ+q8/4CCcOrrGhuxqiJvDXe3oOIv4P0JgIO66
	zFGbyrZTJZVvlDYDcshb+tS2YD3JrIZrdaa2w+8IwKiCZs2rnKcyWzDDlJhDfSQAmFsk8FOgFUf
	iNPEBRandbdXl8O5YHkkGtujenYJQP6ZtCZIuH/MeUMuSkkiU71Y60BH700lvXI0E/BhFUfFRt5
	5zb0aKgf+Bo68mNKAFTjjoYPrQKlQ/86hmArEaf0tReBBKDgk3ubpblGN9kahPm+hrK01fyBlGJ
	vx/lC/htDcLi2t9Hw2TvepPwIanc8Eek1Qb+ES/+aPAV9mzWfLVV5+znZ9kPs09Nkh3ZsH2bnUV
	oQJQl8C3pvaAuiP+/H2egYmsJGU6BvMsoKVyOwl+KTR+M2sGRhlP0bsHAQ9kM4BPOu8g=
X-Received: by 2002:a05:622a:cb:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ee5877bb56mr267226921cf.0.1764328516498;
        Fri, 28 Nov 2025 03:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeCly4SWtrTkquz6Vfv5qfN7qxE5niGnUUnYaToutXBXqDV2gJCGa6u7/8eUMoPl9Ss94C6A==
X-Received: by 2002:a05:622a:cb:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ee5877bb56mr267226241cf.0.1764328516038;
        Fri, 28 Nov 2025 03:15:16 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a21cc9sm419177566b.58.2025.11.28.03.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:15:15 -0800 (PST)
Message-ID: <fcd95d47-1b5f-466f-af94-7a1374777439@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:15:12 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
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
 <20251125-judyln-dts-v4-7-a5a60500b267@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-judyln-dts-v4-7-a5a60500b267@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wtqRWw7GBSXSQ7rd7M8ytq4dnGN5ET80
X-Proofpoint-ORIG-GUID: wtqRWw7GBSXSQ7rd7M8ytq4dnGN5ET80
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=69298445 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IqCYnrxLgLuRO9zwK-sA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MSBTYWx0ZWRfX4zVgubv3unNw
 1zuj0SN9/HlsrnfeO9VLGhN38jCQPkU8GotfSHruGYtVNB5KgnI5HWO+Rk/VklL59xhPffqOzkJ
 7zfeMOgMZhheqp1F+TWxm2srGOpnhN5nLFjvfghJ/IcKhYYbT6k5WVtrosoaLbsymNJDC67SLeM
 fbx/OjOEjgQqHM3CwbNEfrut4J8BcjGwUvgpmlG0pq9mDfFSJ8rYtNeXagzAoNOr5XXVLdy11EK
 RrXPbZ3XmW+ov5UE4wwqjDpWJGBg552gLTzx2A/2J650zqu+nfEfPfuj8ZdOPkNxQC1V0kU6Fvb
 Aqnr3BpneZ3W3lQUTmtvN9jjzatOQXErF4qRKyuAhFMt8e4+3q1Uq36YJrw1deUXsCBALTqe/cp
 AQ5Gt4kunYP/mYAE1bk7Ee6VunlnLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280081

On 11/25/25 9:12 AM, Paul Sajna wrote:
> Wi-Fi now works with this patch and relevant firmware
> 
> ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
> ath10k_snoc 18800000.wifi: qmi fw_version 0x20060285 fw_build_timestamp 2020-10-12 23:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c4-00645-QCAHLSWMTPLZ-1.336037.2
> ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
> ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> ath10k_snoc 18800000.wifi: htt-ver 3.83 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

without the merge conflict leftovers, ofc ;)

Konrad

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index 9ec2edf6134c..a61f7bd65a7a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -141,10 +141,11 @@ sde_te_active_sleep: sde-te-active-sleep-state {
>  		bias-pull-down;
>  	};
>  };
> -<<<<<<< HEAD
> -=======
>  
>  &venus {
>  	firmware-name = "qcom/sdm845/lg/judyln/venus.mbn";
>  };
> ->>>>>>> d58184825fa5 (arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path)
> +
> +&wifi {
> +	qcom,calibration-variant = "lg_judyln";
> +};
> 
