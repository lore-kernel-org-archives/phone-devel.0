Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575161;
	b=eguYtaiTGWhItZjFqFDWFZj1RzlVgd0gBnlThGJGT7D9/nvdOsH6Yw1bbTe/olgF6X2A
	 2tKh2G1U4WfTpV1UefluTZZF6fXMFKKBerCfcywrUjeSjWnMScsve/2d65K0Fvxpwlq5g
	 vrovpKujp1Q02SQPf//YbyMG6qOFQEVhTDj9gOoFkYvHHenPjRg6IJFRKCIScYPLXJK0Q
	 X2y+WfKMDdDS15BMB73E0Ak51nM5TWoDXemriIvQ+DmtfFrpZ323AQFnr+rJkdKbV14A6
	 q9ER7wOZddb+U50ZEMQRxYszTNxBfoGdUoM3sfD4EECTPl8KNhMJNEzlOQ+lmruOG1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575161;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
	b=oH9p5LoMJhUw8riZdvCR6mx6O2eQ7BqwgFfW8sksUvsXyZF1O7jk8iAvl41IU5IVNVh7
	 p9gUY4HhJxSAApM/WI9xlSxwMvI5dUJdm1ixRDi2HTPntWBrcqAb8i8TY6opd++L93ffU
	 YcnLs7af2NJI7QUOp4sLsI2u9sa/HYt01TUoeRU4froMsmK8qvrVyJqqFnTZLOk9ff1Pe
	 NUPmeb4MHuWZQ920mCI7C++93/n0Y432XLcuvwLwl4dw4AThqQjDb+Q0MArexxQlaCr20
	 b/C5858+h1DOuJlcDioY+DrJMh1k7SHrk27uibR68wH+aJAk4OoL1aUtezWLT4ca0LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUtPRNxx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jY3AlhAy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B945606A31A
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B945606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUtPRNxx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jY3AlhAy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j3Wi3355940
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=; b=JUtPRNxxI67F6Hv3
	kk03khUGkyKsuGjWIQMaGq2/MOQBBc/V33NO6OeW38ML6V/KVU3RhV2cGXOXSYB/
	1cjnMSPhbOl1RCxQVx+O0PnvNQQNzH1oG/p72Cqnd6rrB8n5DTPknV3S9VRhHXIl
	nCFuO8YVNFXozMw5MVCjRBn1VDqLT7On1XG2BOJJ3HJ7ScphFTDZCv/FelQR/aIf
	Dh83BrZ1VhPZFrZ8iBKMu2tyY6GAuRk3XFZe3GjD4mid/xW/Vw1GlJFz4h0P+8IL
	F33bpLGLY9OScl9ZxVnQiKQrk0dY8jCijAbqMQfOpW0ZSrqOsjCQlszcVa1D6XyW
	90I1uA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0k8mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5350173dc7aso1566871cf.0
        for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 02:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575160; x=1793179960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
        b=jY3AlhAyweYyNw6+MCdXN79EwCBjjAPJd58GmV5vhpMeDtZRu0JL/rd0UmwV92Zmbw
         xOoY2TuZdXZdoiubQc4kNt7gIwVN+5SqW/oqKT0g2XHl6ENBZuerzKHrDlNndQOCLrsa
         JT+xpEq1nscQviX8oVrNnnsiDyQGVaNjgHlAn4lBjBKbH9rgN7eVLGTVO00ZpHgF9P2A
         6hRFpqRn983GnD++ydUa4QZZMK73XPwwHXxK0Aapm/3LGehubvvVPnyzvR+yDMdllsq2
         OxtyqqW2RWEEF1KO8ZXMkaO5+9VdEBFT1UtNsuR00zNMvhmjOJ0gV2lOW6TYLrwCqxa1
         BmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575160; x=1793179960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
        b=r6eoD3vnRLCgZjmo80J0pufTJkjwIwHIHQQYKKmjJY1LEbX0bvk4Pt8tqvJlFBZohY
         ndDDuLgB1LMaRbSWYISQadoClx0ISFreGfp9jQr5B0tjdSXZdTlw9v+svW44N1CU/ZFD
         VhXCuL7/q5asXgIFzfcOP6MVjO/v+DtauIHlq+WUpw01pIdeX6UyqC6pa/grppcN5aSP
         7P3k7OXtl37x5R43Sw8VZSkpDW2NRuOo29UxaG2G5jRV3RAFKwVRBtlpVbmj3okxkdyO
         K+S3/Tvk7MKtrvS2p2s/lf37EN1T0N3DTI2v57+xviaU+d4+EwbCp065BH7AMptQMj6i
         7R0g==
X-Forwarded-Encrypted: i=1; AKwUvBzaVzyApY1GyGwrcQbe3lgGaog8XtG1EBLjp77xlveaeLqGgkaTEoDZwMaUgFx9X+dixUuMgfOe8+41EQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLHLcOnHE7mnieUNGiElyYGCCbg7OckYEVT1w6I0ARt15jWNwDE
	IxeC462wYij6coAG9n9hwIVq2QIS9i/FozzyItTXvIBIKdX52xLonDQ5zzR9omtp7sh3Io/CDds
	/mZGtBH1tp5M4enEJKqHKF8gWZmvH2spFfIv1c8Ioq/oCGLzV/1d9nvk3REMHfWWTaw==
X-Gm-Gg: AYBFou0GCrVxUki7jQ3KrEusGpRkGauT+G8zNhGnrwcGHuKa6QB2rZaIWUC3bEJ8ed0
	iEwKY89CJ16DVcSVW0I929pkDcGkGReuGLbtP2UXgW1n+fbuSBDdHuyCfAHpcn8ZcvToaPglHTb
	pA16xGtXB/q6g6PxahmeuI8SmUEYwhB2KhL90Fao+9GJGpMIgtYbsVCj0elZPQGNQAB2294HszA
	PZqzSd725K1K7wURM+vCSRKjIdRxkqla3rd0ZpSClcPUThZP57v7Ncm23N+rFqgqDAZb+3V5ZB2
	nFqgfSJnXftkMouJcwFYWvFgTAL8UPe6+jW0pvAUhwLR+koGYkcT4DLUP606sCT86fYKxtKbJVp
	d/9pWfzsp3CVPlHEYwycpBA==
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr29271471cf.0.1792575159806;
        Wed, 21 Oct 2026 02:32:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr29271151cf.0.1792575159341;
        Wed, 21 Oct 2026 02:32:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7b728sm58385366b.29.2026.10.21.02.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:32:38 -0700 (PDT)
Message-ID: <124dbc57-162c-48a5-b405-73f3b560bcf0@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:32:34 +0200
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sdm845-google: Add WCD9340 codec
 and microphone capture
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
References: <20261016-pixel3-audio-v6-0-11c88448b3be@ixit.cz>
 <20261016-pixel3-audio-v6-2-11c88448b3be@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-pixel3-audio-v6-2-11c88448b3be@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXwh4W21Q4AgND
 6U4HytRCaVfz9vnGY36t6A0Yvq6rc10rndda88UMTOK0fghyLaeCOWiPN84n1ydDTwVfPdRQMGD
 b1BVEHm0thZqloy1skzqXwyFN/xeiytjB45eoUDHikcOO67zuUyqZueHDYWl98JvsM95l6g+/tA
 4S9XWyXxuzYnbDNw6mnY8kzUQNMnNHX7uejXnY5ciCDcqluqI01ccTCeM98nrI48pcYo0YAvQxh
 iRaDJ3BTBLVzwcPYr2zkIMLiVL2I/82qN4Zna0jdp59mz+4sxJcFVEYsR3GB7LUWh39ddJAvnCM
 IuFMUuPhYqQSbiip507d+HaCaHraBTnYwrqCzche1T+BZlFoZEjA+w02q67ztjJ4kWZZCiBn5U1
 giO92FFC5/Zcg/XGDWw2G+5QLWkQ1Rs1cR2GjKVOpmYzNIQ9jtCgbkzqpKRkgSdGVwxHEb3pezu
 q0Wie89QXCeGglbtQ3A==
X-Proofpoint-ORIG-GUID: 6vs8T2QrX_nqeN4WIMlbGwuHx6JZjSl8
X-Proofpoint-GUID: 6vs8T2QrX_nqeN4WIMlbGwuHx6JZjSl8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX1B7HXIgRa9o/
 ZiU7IQMgMj0HJ2bh2GYBZjBQi766u22MMSki2Kc7SLv4BDzlNvFUxyc1ksj2tQS/sAvhVhqOUDg
 ffJzvqtHTlfGkW+mQxbqT97jnFuEGPs=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad886b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=d2f5cIJWjcLx9DfYaNwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210037

On 10/16/26 11:52 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 sound card so far only drove the two CS35L36 speaker
> amplifiers. Wire in the WCD9340 codec , add a SLIMbus capture link
> for it and route the three digital microphones
> 
> Based on work done by Casey Tunturi.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
