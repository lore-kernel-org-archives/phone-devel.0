Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB92D9EEC
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764114524; cv=none; b=KbM+14RHenn2Y8PGchfjkNbJKMgY4aXam67ozWCx+DgPRRnL3ilmV6L9MNdfM/Nk+G3rop84ci/dQKYFpZaFJqu9oQyABHvYXjG3e9ZRYA33xMUyTlmjahTwZTSyqM4htne+Nroyt8J4lfZf6ZEmsL6cO62Okk5d1uZhpA4iebQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764114524; c=relaxed/simple;
	bh=0Mlyhx695BkVTyiblfoWvSYhVsoxNzGhcYR/1u0Vwps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ujz9s4d1Dijs1p7QkNv5PuqCEjObeSIvkGgp4JZ+hh/ZvJ2+pATcmhhgnpP19am5pv8kTc39wZIswOF62Ojh6IQwfxHPV8NGFkvFSKHzNHreZw8kjRS5eBVz3KdETQvoZBZmpQ1ty/IUHmRm1F4E5TM2L2R1Ce6vxtZBrnaXk/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RS7Rlx16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIwgxhs2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RS7Rlx16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIwgxhs2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APFSk6X2726776
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k5jDEGG25I4fC1NOVLJpbEU6
	TiEXOx1Y+8hrvGoC+dc=; b=RS7Rlx16a02VrUIvd5ojRZi43FxbiQJfJ2jlUXyI
	IE59OhamC/V8eqRUFB8ss/DwbQtQH1JEEhYn9Grcr8gVlQrp9lm/LpFUGmAbKE9F
	QKcbcAJbLqPQiMDNd9ncpf7PYLLaI/bogue4EgDVSKK6lNbfYViClxMgRBA30l9a
	YEIfgxwiuwhohQFsJQu0/DGkuOWWB6Hl6x0bYqdOf9+Gis+iw9xD0dga+qL7aJBr
	wQyBRjm7q8WxdXcFkeRWGc5cMbQsUzAGh+ruChgpNR2sbOsbmAVVBRZDHY/3sVLw
	EjvWo0ElbnDBhmYqBHQMBfABzuZarYIbq5sK0BiOTlFuNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an8rvtjnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:48:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1d8f56e24so1689740785a.2
        for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 15:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764114521; x=1764719321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k5jDEGG25I4fC1NOVLJpbEU6TiEXOx1Y+8hrvGoC+dc=;
        b=MIwgxhs2vpUjNctbMPzOXwWoi8NfTOTSV8GsWQgTSAwhPwAMigDhv0ivT0XaOmXkuX
         uJHlVB4/tZ0LoraRIjDVjiRkFtERPh9P1TJnGan//GKfY1djHO4Pvr/Vkn/fz4xi1QQo
         iClCPJJwPF2Pyql5GoxkqJ43P9F5rCY7R9W6vFDvzYcP/neD5UAdime6bD4vtr6TkMIV
         kXZayx3yN/e+YEWw4hpLzkbYGNC2iDNtDpD3MaEJYDqsYY8quFHHKufAty6C+uddbGp8
         I+DAH4CjVZ3UPznvgrIK1JtD9KUA9W2/9JlJMnGMefg1XwQCqk8l8oEDLMh6mn5UjWbS
         Ag5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764114521; x=1764719321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5jDEGG25I4fC1NOVLJpbEU6TiEXOx1Y+8hrvGoC+dc=;
        b=FIrihVcDhi2apcpsfOJroGX9H9h4QITHP2P7ymug1hWcNC5Mb3dtYYtSmyP2u4PFCv
         kabyqYLWqlPFENbsGWHxmbj6jLXlaGuZh0r+R8MM3Gz1arDLo09V6sLOycmzKr6eKOnP
         rNL7YcapFvYjYJOGIaNofaBs1EV8ni605X2l1sOifcRRS8ZsN0NC+Dyqyk7PVPn87yhj
         dD0OR2Z+56Nqpej4wgVCzvwc1BlZBNjxFU6Xkq/fGLEKz+oSXXRIl3bn1fOi8vRkK7hf
         o+/po0honDVNjwgWem0I2fpxT7EXmqh5ijUBRmnoIg9r7/5j4CONK4doi8AjwE/HS0Bq
         TyeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUj6tXSM8Y+XKrmENdZPTQ85u+sxfKhYH+Ubs3NauBAqeLTX67jk+GgF5B8Dt3X+B3+9eftlQt4P27Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybgtzBXg0dWvYFhKG0zwA3jABPu+hSi2iIDeKEG4kvjcBv5eD8
	kESlGX3PwOgmNg9L0tdg+ApaMUg6FOzWsjiyZA0sglzhC9fn0CDnO1NHQj9XWUv3pDRuiZ3MMSn
	BK+2yt9hGjZ1SAtPpO/F9JAvcvszh0g4SwcTyY8nhWFxCuqDtfHXqo9Yw5JsXOWRzqA==
X-Gm-Gg: ASbGncvaSKzzGHSMU7mX4/O4EW2u9tiT/+7Y4brmTHGm9JgfSWjmhbQW+9CPhA0ZC6/
	sG7qh9w86CYg+RJrPnweEYW6hajwMUQG7E0CKPcLVjeT7DkuEFXAPtGcKw7cJq4zk03ZmI2mVL8
	dc1nibKtUq4qKWoanZCq+4Lb/LVFq0NSADP9iCJeuKg4Q0cV/w2qvRlYjMSgrzBDPjlsJSCn/iW
	00tD7HBXZn4mrruflUfr/ZjyfSdgFc5TK5NJWG+7Y4NaO6pO15Rjm96f0E1JNPvxGPSSqkOX6gb
	/dym6NMbXXyu6qrpSGwpXVEt3MeGbQtp3z2HNX/b1jV8xLsL8/407IP31491hYYy+8T6IPs2t5+
	qPw11hzAOBoi6CZNJWi9kxEEkZ3GK+FJ8oTPQ0cdSVudN/HEJUy9XX+eqiiMFq2YpSIy/aicjxW
	7CdYaaBJhSgFUIE44tnK0Tlm4=
X-Received: by 2002:a05:620a:4402:b0:8a3:f8c2:5ee4 with SMTP id af79cd13be357-8b4ebd821bemr613779385a.37.1764114521457;
        Tue, 25 Nov 2025 15:48:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFd7T6aPJkSDHrzf/XM/oH9ZfLFa60qTGg28nQcNctnpUzmJUsrOR97i7a4b/c9x3o1jjM7qQ==
X-Received: by 2002:a05:620a:4402:b0:8a3:f8c2:5ee4 with SMTP id af79cd13be357-8b4ebd821bemr613776485a.37.1764114521011;
        Tue, 25 Nov 2025 15:48:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db756d3sm5568378e87.14.2025.11.25.15.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 15:48:40 -0800 (PST)
Date: Wed, 26 Nov 2025 01:48:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 6/8] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 fuel gauge
Message-ID: <eysmjuxmvl4nfn34hfiqw4pwfptepibo6ez6tlunegk6dpmc4p@hbzex6w4dxnp>
References: <20251124-pmi8998_fuel_gauge-v1-0-dd3791f61478@ixit.cz>
 <20251124-pmi8998_fuel_gauge-v1-6-dd3791f61478@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-pmi8998_fuel_gauge-v1-6-dd3791f61478@ixit.cz>
X-Proofpoint-ORIG-GUID: nXEdNJdiNUBSICn_IDX0fFXFyiQDi0s1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE5OCBTYWx0ZWRfXy9T4PDctCjkl
 caCnQJjZzoj4YJhF3mFO8DdEIRV/okDKheemXz9x+dF/4sHj3cn6iJiMhJZTJDWI17lNPVPUHlc
 bgn4D2lnEQUZbP2tJKKukub8gFqXE1j6O5xbqdXgQCcatNzg5wPImMkkVnrlC7H/jng5KD6urE7
 cjvgKrx2UHgb8p2+TrWAa3gp0P3O4XMhw181Ygqpkt65WPpUh0bp/tvp2yHfs6khw+fzNZNp5HS
 Uaj08drBb10bDUW8jV+hDL4rtswMx/3sLFKqjcL54IQc5rAoWVIsjfLTk5Y+G2Kt2Bmpul7ov3f
 bE0qnb8CmAvj2/JfJQ0b7KlYcVULSiQMZIL1brq6EFIq+53QJhqsfStWMcMjafsswO22OWlqvBj
 NvhmylL2SvM7T1vCZra590Ivj+bnqQ==
X-Proofpoint-GUID: nXEdNJdiNUBSICn_IDX0fFXFyiQDi0s1
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=6926405a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=jB8_oC6jW5EHyFLWiXQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250198

On Mon, Nov 24, 2025 at 10:53:39PM +0100, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Enable the fuel gauge and configure the associated charger and battery.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
