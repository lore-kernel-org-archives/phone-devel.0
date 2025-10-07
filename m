Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3302D3727
	for <phone-devel@vger.kernel.org>; Tue,  7 Oct 2025 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759831477; cv=none; b=mKN6lXRgoVW4hYShL7ibtXEoi15puC8/vJO53lGC7c0gsy/lsz4p+PdrWOk1GVHvJXNzCic9Mm1EzJiDZAOejgqhNNaS1h0FseDdUVqXE6Fi/OKR2q/jnIXWjq1nPcZo3MqioaKKHmTzTJflGQijlGfnJ3I8uVdT9vMB9dSTCNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759831477; c=relaxed/simple;
	bh=syP41pd5R9Uci+nN7DevDmDEh8xWqwmT9OEsz3zK+k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mVcDd/IIGm9aFC3+0Su/ZBI6pHx0WoguuxGLOHTcQzheLDqp2eX5+V2U/rf7A2PDSsOCQTd5B5I5wGFzUKcjMAt0yHSwZh+ugeIRrvGl/fzqtUFqqZQRJ8J2h95ZKMnD3mOJfiB2QcTgL40AedW/f/7lKv6PLFSjcMAi+MI8Rp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQzXMFq3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQzXMFq3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5972qH45001346
	for <phone-devel@vger.kernel.org>; Tue, 7 Oct 2025 10:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UVqmNkVuyqg9n+wG3FSRNwGdnQf4FyV3jtMEgH1StCc=; b=kQzXMFq3dERTPmJR
	i3tyTvk7Qkt7984vJW+dXREFf6N0AEzJqZRFzLCx1jHzwMyGu7h4XDjnHv4Rxb9I
	YPFowLoQ8cwKkyQYS49ELr6a8eZQf9KIlJEwqlezEGztQPfABLJhh609toKvQ2Je
	XrZChq57p+bQtZdX8WbDTnmv3Pg/aEt4sbeCkrYFBbDYCs8Gi+4p1G3QHSAju9Je
	FRV6sZL/cgJIosLS0q2G5UdMKSCtmTNFxdrvluAMyDnTD4mg3PYlH+IbMvIjSrD+
	pHDh15VEWEVjz8evWxOg8yEXMhUeZABWg3h59UuBbEs4FW2ZzULmnrAu/GMpsnaS
	x650ig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1pswc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Oct 2025 10:04:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-853f011da26so197686785a.0
        for <phone-devel@vger.kernel.org>; Tue, 07 Oct 2025 03:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831474; x=1760436274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVqmNkVuyqg9n+wG3FSRNwGdnQf4FyV3jtMEgH1StCc=;
        b=SV6pm4N3UWMKVvKrY0mMvIZDZimjH2bJA3SCakC5ibEMp13amCH0C0juIRAmsroh3x
         OicvY7ndrfHEY+g0iEDQmvat0doxGIDoJNlJvjBUb861S9hQhkL5jxAx7+J3zOcNofPo
         PkIf5W1sFOIf8qmpyqVyh/6MaXJxDgRRhcrw5eIYWM0UL9Im3H36l8BTtTjIONvR3Z4r
         6R+OiKWy/SC6x94yIP8HyIlFaTRuRMTA6XH8BjfCb3NxVcIjCz/kd58fuUlnH/wKJDai
         MQBtp3SS2OCQl4wt7jZPqb4Sm5waqw4H/0cXYiWiaeIl5CBMpBZmFymIbg4EvMNvT8Mu
         SFmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSWkcz7tb0QDF56EfBXkgqgjHGWyGl0Y7KihSLICac/EHu/ympEEEmkWGeZR66dxK1q1i3x+GCxoSXWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1l6o8GH3OQnpZyQJM1XKHsoy32VbYrM/H14YLPmM+qfu6YXMw
	lxAiiFH7rj434mV9BK9rqUMPKsSGTbpHZN4JheMdo+7b9sU6XNCyUgXt5xi2R8LiaVusne2PmRF
	mBVgmwZEi0Kwcidy7FCBwYjTh8oLPC+A3HROgvg53q19pCHwmchPOgoQ4jAS81I7bFQ==
X-Gm-Gg: ASbGncsGSWq9r9pG5B+h1s+KRdJ/MBlfStZsjgQmMG5SpqmfV4KdzFq6Q8cuxgnHZO1
	QGnxOIBjpW2tEv4x4hTbi1fCtQ8HdWg5AcwsolsC6MBfxupbBSyOVBm9mPnmfeBi3I7xUbsnGVv
	ig6vVS64+Ykm4xuuTgnqL07N2ed7g7YUxnpVjIsPqxjbre710xsTnLGYKJyyaLZl4I48vdFEg0Q
	TQyI2Lom0I+a/Ygkp5dN3Hdg1xom7DM/0/MeVTDZ0hZQiRnucOOx0JAqUzKE/li5fASQRASX/Rr
	kNDCdgIfPacjNFAQ0kkE888+WgXjfLGiFMVOWx9TaLpTerU3KlQCbAK6eMvc/qoMp8TaeEgCdGY
	/RedbTEYf/fM5EmR01Xc3BV7K6cA=
X-Received: by 2002:a05:622a:11cd:b0:4d8:85db:314 with SMTP id d75a77b69052e-4e576b0937emr121120011cf.11.1759831473591;
        Tue, 07 Oct 2025 03:04:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNIWw2SAUTUQLNb+7LVAsg57ghgAbUy9HBwlXY4iZKFwFCHllk7t4lrcnif05kVwqiugILGQ==
X-Received: by 2002:a05:622a:11cd:b0:4d8:85db:314 with SMTP id d75a77b69052e-4e576b0937emr121119701cf.11.1759831473052;
        Tue, 07 Oct 2025 03:04:33 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3b70aesm12333222a12.17.2025.10.07.03.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:04:32 -0700 (PDT)
Message-ID: <5a9a2ed9-9e95-4bb0-b5b9-e4e0edcfa8d8@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:04:30 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _0BkMjoiljaPnblPhE7Cj6VgIhsprizd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX2e9kSJDkd735
 l4Z5rihpqQvIEjckMD7UuLnt+F/Cgp2vWA3z0jhyRyfVBk8ukADkXsYna+fUK7r4BW2o1yzcKVN
 rzmIpVB8U5ydR0nvgGQdY31Tw/90PxsWrngjnOkp7oJ6rQDN7w2p94I32YQI7OQaY1sysd+cuh0
 /IhNBgrEbtZBEEI/UcXxy2tTQdX8x74zikZq/IO83tNAloWA2C9ftxv4+Tjzm3aftLMfCJivk0C
 FyMDoijZNLRDr0tEiafDufzKRTg3fvdbM4v7QqBNgY2ce/TLRXnkZnMgMKzpQApIGjm4N41WQHH
 6XzgHd3bybSmhcmRf2km2jWhbiji0PnYJjiS9FDUe9d416mAgKRWRTn5fGHrZOFBzOC21tt9B+t
 WDPcAR0btVXXYq7WJDW1kFbuhqoenw==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e4e5b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=8poMKPHdAAAA:8 a=2dNuJvzwNQBdB-WvFZIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-ORIG-GUID: _0BkMjoiljaPnblPhE7Cj6VgIhsprizd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the touchscreen device node for the HTC One (M8).
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> index 36eb42f0f3d9..040a256f9465 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> @@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
>  	};
>  };
>  
> +&blsp1_i2c2 {
> +	clock-frequency = <384000>;

This is not a valid I2C frequency

You're looking for 100/400/1000 kHz

Konrad


